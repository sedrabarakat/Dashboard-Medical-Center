import 'package:bloc/bloc.dart';
import 'package:dashboad/core/data/datasources/local.dart';
import 'package:dashboad/core/domain/error_handler/network_exceptions.dart';
import 'package:dashboad/core/helpers/json_helper.dart';
import 'package:dashboad/core/widgets/toast_bar.dart';
import 'package:dashboad/features/doctors/data/model/doctor_model.dart';
import 'package:dashboad/features/doctors/domain/repositories/doctor_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../create_account/presentation/cubits/add_account_cubit.dart';

part 'doctor_state.dart';

class DoctorCubit extends Cubit<DoctorState> {
  final DoctorRepo _repo;

  DoctorCubit(this._repo) : super(DoctorInitialState());

  static DoctorCubit get(context) => BlocProvider.of(context);

  List<DoctorModel> _doctors = [];

  Future<void> getDoctors() async {
    List<String> cachedDoctors =
        await SharedPrefrence.getListOfString('doctors');
    // Check if there is cached data if true then return the cached data
    if (cachedDoctors.isNotEmpty) {
      _doctors = JsonHelper.convertListOfStringToListOfObjects<DoctorModel>(
        cachedDoctors,
        DoctorModel.fromJson,
      );
      emit(GetDoctorsSuccessState(_doctors));
      return;
    }
    emit(GetDoctorsLoadingState());
    final response = await _repo.getDoctors();
    response.fold((error) {
      emit(GetDoctorsErrorState(error));
    }, (data) async {
      List<DoctorModel> listOfDoctors =
          data.list.map((doctors) => doctors as DoctorModel).toList();
      _doctors = listOfDoctors;
      SharedPrefrence.saveListOfObject(_doctors, 'doctors');
      emit(GetDoctorsSuccessState(_doctors));
    });
  }

  Future<void> deleteDoctors(BuildContext context, int id) async {
    DoctorModel removedDoctor =
        _doctors.firstWhere((doctor) => doctor.id == id);
    _doctors.removeWhere((doctor) => doctor.id == id);
    final response = await _repo.deleteDoctors(id);
    response.fold((error) {
      ToastBar.onNetworkFailure(context,
          networkException: error, title: "Error");
      _doctors.add(removedDoctor);
      emit(DeleteDoctorErrorState(error));
    }, (unit) {
      SharedPrefrence.saveListOfObject(_doctors, 'doctors');
      emit(
        DeleteDoctorSuccessState(_doctors),
      );
    });
  }

  ///doctor profile

  bool isEditing = false;

  int? Doctor_id;

  void setId({required int id}) {
    Doctor_id = id;
    print(Doctor_id);
  }

  var First_name = TextEditingController();
  var Middle_name = TextEditingController();
  var Last_name = TextEditingController();
  var Phone = TextEditingController(text: "+963 ");
  var Description = TextEditingController();
  var Password = TextEditingController();
  var Day_In_Advance = TextEditingController();
  var Duration = TextEditingController();
  var Section = TextEditingController();
  var Section_id;
  var image;

  DoctorModel? doctorModel;

  Future<void> getDoctorProfile({required int id}) async {
    await _repo.getProfile(id: id).then((value) {
      value.fold((error) {
        emit(Error_Get_Doctor(error));
      }, (DoctorModel) {
        doctorModel = DoctorModel;
        First_name.text = DoctorModel.userData.firstName;
        Middle_name.text = DoctorModel.userData.middleName;
        Last_name.text = DoctorModel.userData.lastName;
        Phone.text = DoctorModel.userData.phoneNumber;
        Description.text = DoctorModel.userData.description;
        Day_In_Advance.text = DoctorModel.daysInAdvance.toString();
        Duration.text = DoctorModel.sessionDuration.toString();
        Section.text = DoctorModel.section!.sectionName.toString();
        Section_id = DoctorModel.section!.id;
        image = DoctorModel.userData.image;
        emit(Success_Get_Doctor());
      });
    });
  }

  void editingToggle() {
    isEditing = !isEditing;
    emit(Editing_ToggleProfile_State());
  }

  void cancelEditing() {
    getDoctorProfile(id: Doctor_id!);
    isEditing = false;
    emit(Cancel_Editing_State());
  }

  ///Sections for update
  List<String>? SectionsName;
  List<Map<String, int>> Sections = [];

  void getSections({required context}) {
    AddAccountCubit.get(context).getSection();
    SectionsName = AddAccountCubit.get(context).SectionNames;
    Sections = AddAccountCubit.get(context).Sections;
    emit(Get_Section_State());
  }

  void Select_SectionId({required int id}) {
    Section_id = id;
    emit(Select_Sections_State());
  }

  ///

  Future<void> updateProfile() async {
    emit(Loading_Update_Doctor());
    return _repo.updateProfile(
      id: Doctor_id!,
      first_name: First_name.text,
      middle_name: Middle_name.text,
      last_name: Last_name.text,
      phone_number: Phone.text,
      description: Description.text ,
      Section_id: Section_id.toString(),
      Session_duration: Duration.text,
      Day_In_Advanced: Day_In_Advance.text,
      //   Working_hour: ""
    )
        .then((value) {
      value.fold((error) {
        emit(Error_Update_Doctor(error));
      }, (DoctorModel) {
        isEditing=false;
        emit(Success_Update_Doctor());
      });
    });
  }
}
