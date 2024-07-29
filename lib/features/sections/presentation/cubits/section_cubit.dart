import 'package:dashboad/core/data/datasources/local.dart';
import 'package:dashboad/core/domain/error_handler/network_exceptions.dart';
import 'package:dashboad/core/helpers/json_helper.dart';
import 'package:dashboad/features/sections/data/models/section_model.dart';
import 'package:dashboad/features/sections/domain/repositories/section_repo.dart';

import 'package:dashboad/features/sections/presentation/widgets/section_item_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:progress_state_button/progress_button.dart';
part 'section_state.dart';

class SectionCubit extends Cubit<SectionState> {
  final SectionRepo _repo;
  // Section
  TextEditingController sectionName = TextEditingController();
  ButtonState createSectionButtonState = ButtonState.idle;
  List<SectionModel> _sections = [];
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
    final response = await _repo.createSection(sectionName.text);
    response.fold(
      (e) {
        createSectionButtonState = ButtonState.fail;
        emit(CreateSectionErrorState(e));
      },
      (data) {
        createSectionButtonState = ButtonState.idle;
        sectionName.clear();
        emit(CreateSectionSuccessState(data.message));
        _sections.add(
          SectionModel(id: data.data!.id, sectionName: data.data!.sectionName),
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
    response.fold(
      (e) => emit(GetSectionInformationErrorState(e)),
      (data) => emit(
        GetSectionInformationSuccessState(data.data!),
      ),
    );
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

  void addSectionService() {
    listKey.currentState!.insertItem(sectionServices.length,
        duration: const Duration(milliseconds: 500));
    sectionServices.add(
      SectionService(
        name: serviceName.text,
        price: int.parse(servicePrice.text),
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
