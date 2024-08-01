import 'dart:typed_data';

import 'package:dashboad/core/data/datasources/local.dart';
import 'package:dashboad/core/domain/error_handler/network_exceptions.dart';
import 'package:dashboad/core/helpers/json_helper.dart';
import 'package:dashboad/core/utils/style_manager.dart';
import 'package:dashboad/core/utils/validator_manager.dart';
import 'package:dashboad/features/auth/presentation/widgets/auth_field.dart';
import 'package:dashboad/features/auth/presentation/widgets/custom_state_button.dart';
import 'package:dashboad/features/sections/data/models/section_model.dart';
import 'package:dashboad/features/sections/domain/repositories/section_repo.dart';
import 'package:dashboad/features/sections/presentation/screens/section_details.dart';

import 'package:dashboad/features/sections/presentation/widgets/section_item_list.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:progress_state_button/progress_button.dart';
part 'section_state.dart';

class SectionCubit extends Cubit<SectionState> {
  final SectionRepo _repo;
  // Section
  TextEditingController sectionName = TextEditingController();
  TextEditingController sectionImageName = TextEditingController();
  ButtonState createSectionButtonState = ButtonState.idle;
  GlobalKey<FormState> addSectionKey = GlobalKey<FormState>();
  List<SectionModel> _sections = [];
  SectionModel? sectionDetails;
  Uint8List? pickedSectionImage;

  // Service
  TextEditingController serviceName = TextEditingController();
  TextEditingController servicePrice = TextEditingController();
  GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();
  List<SectionService> sectionServices = [];
  GlobalKey<FormState> addServiceKey = GlobalKey<FormState>();

  int? previousId;
  SectionCubit(this._repo) : super(SectionInitialState());

  Future<void> createSection() async {
    emit(CreateSectionLoadingState());
    createSectionButtonState = ButtonState.loading;

    final response = await _repo.createSection(
        sectionName.text, pickedSectionImage!, sectionServices);
    response.fold(
      (e) {
        createSectionButtonState = ButtonState.fail;
        emit(CreateSectionErrorState(e));
      },
      (data) {
        createSectionButtonState = ButtonState.idle;
        pickedSectionImage = null;
        sectionImageName.clear();
        sectionName.clear();
        emit(CreateSectionSuccessState(data.message));
        _sections.add(
          SectionModel(
              id: data.data!.id,
              sectionName: data.data!.sectionName,
              image: data.data!.image),
        );
        emit(GetSectionsSuccessState(_sections));
      },
    );
  }

  Future<void> updateSection(int id) async {
    emit(UpdateSectionLoadingState());
    final response = await _repo.updateSection(id, 'Updated Section');
    response.fold(
      (e) => emit(UpdateSectionErrorState(e)),
      (data) => emit(UpdateSectionSuccessState(data.data!)),
    );
  }

  Future<void> getSections() async {
    emit(GetSectionsLoadingState());
    List<String> cachedSections =
        await SharedPrefrence.getListOfString('sections');
    // Check if there is cached data if true then return the cached data
    if (cachedSections.isNotEmpty) {
      _sections = JsonHelper.convertListOfStringToListOfObjects<SectionModel>(
        cachedSections,
        SectionModel.fromJson,
      );
      emit(GetSectionsSuccessState(_sections));
      return;
    }
    final response = await _repo.getSections();
    response.fold((e) {
      emit(GetSectionsErrorState(e));
    }, (data) {
      List<SectionModel> sections =
          data.list.map((section) => section as SectionModel).toList();

      _sections = sections;
      SharedPrefrence.saveListOfObject(_sections, 'sections');
      _sections = sections;

      emit(GetSectionsSuccessState(_sections));
    });
  }

  Future<void> getSectionInformation(int id) async {
    if (previousId == null) {
      previousId = id;
    } else if (previousId == id) {
      return;
    } else {
      previousId = id;
    }
    emit(GetSectionInformationLoadingState());
    final response = await _repo.getSectionInformation(id);
    response.fold((e) => emit(GetSectionInformationErrorState(e)), (data) {
      sectionDetails = data.data;
      emit(
        GetSectionInformationSuccessState(data.data!),
      );
    });
  }

  Future<void> deleteSection(int id) async {
    final response = await _repo.deleteSection(id);
    response.fold(
      (e) => emit(DeleteSectionErrorState(e)),
      (data) {
        _sections.removeWhere((section) => section.id == id);
        emit(DeleteSectionSuccessState(data.message));
        emit(GetSectionsSuccessState(_sections));
      },
    );
  }

  Future<void> editService(int serviceId, String sectionId) async {
    emit(EditServiceLoadingState());
    final response = await _repo.editService(
      serviceId,
      serviceName.text,
      servicePrice.text,
      "description",
      sectionId,
    );
    response.fold((e) {
      emit(EditServiceErrorState(e));
    }, (data) {
      int index = sectionDetails!.service!
          .indexWhere((element) => element.id == serviceId);
      sectionDetails!.service!
          .removeWhere((element) => element.id == serviceId);
      sectionDetails!.service!.insert(index, data.data!);
      serviceName.clear();
      servicePrice.clear();
      emit(EditServiceSuccessState(data.data!));
      emit(GetSectionInformationSuccessState(sectionDetails!));
    });
  }

  Future<void> deleteService(int id) async {
    final response = await _repo.deleteService(id);
    response.fold((e) => emit(DeleteServiceErrorState(e)), (e) {
      emit(DeleteServiceSuccessState(e.message));
      sectionDetails!.service!.removeWhere((element) => element.id == id);
      emit(GetSectionInformationSuccessState(sectionDetails!));
    });
  }

  void pickSectionImage() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'jpeg', 'png', 'svg'],
    );
    if (result != null) {
      final file = result.files.first;

      pickedSectionImage = file.bytes!;
      sectionImageName.text = result.files.first.name;
    }
  }

  Future<void> showServiceDialog({
    required BuildContext context,
    required bool edit,
    int? index,
  }) async {
    if (edit) {
      serviceName.text = sectionDetails!.service![index!].name;
      servicePrice.text = sectionDetails!.service![index].price;
    }
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          edit ? 'Edit Service' : 'Add Service',
          style: StyleManager.font30Bold,
        ),
        content: Form(
          key: addServiceKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AuthTextField(
                controller: serviceName,
                label: "Service Name",
                validator: (value) => ValidatorManager().validateName(value!),
              ),
              AuthTextField(
                controller: servicePrice,
                label: "Price",
                validator: (value) => ValidatorManager().validateNumber(value!),
              )
            ],
          ),
        ),
        actions: [
          CustomStateButton(
            onPressed: () async {
              if (addServiceKey.currentState!.validate()) {
                // Todo handle the edit
                if (edit) {
                  await editService(sectionDetails!.service![index!].id,
                          sectionDetails!.id.toString())
                      .then((e) {
                    Navigator.of(context).pop();
                  });
                } else {
                  addSectionService();
                  Navigator.of(context).pop();
                }
              }
            },
            currentState: ButtonState.idle,
            label: edit ? "Edit" : "Add",
          )
        ],
      ),
    );
  }

  void addSectionService() {
    listKey.currentState!.insertItem(sectionServices.length,
        duration: const Duration(milliseconds: 500));
    sectionServices.add(
      SectionService(
        id: 0,
        name: serviceName.text,
        price: servicePrice.text,
      ),
    );
    serviceName.clear();
    servicePrice.clear();
    emit(AddSectionService());
  }

  void removeSectionService(int index) {
    SectionService item = sectionServices[index];
    listKey.currentState!.removeItem(
      index,
      (context, animation) => SectionItemList(
        animation: animation,
        value: item,
        onRemovePressed: () {},
      ),
    );
    sectionServices.removeAt(index);
    emit(RemoveSectionService());
  }
}
