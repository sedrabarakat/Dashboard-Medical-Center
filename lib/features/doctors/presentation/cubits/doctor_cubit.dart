import 'package:dashboad/core/data/datasources/local.dart';
import 'package:dashboad/core/domain/error_handler/network_exceptions.dart';
import 'package:dashboad/core/helpers/json_helper.dart';
import 'package:dashboad/core/widgets/toast_bar.dart';
import 'package:dashboad/features/doctors/data/model/doctor_model.dart';
import 'package:dashboad/features/doctors/domain/repositories/doctor_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../create_account/presentation/cubits/add_account_cubit.dart';
import '../../data/model/schedule_model.dart';

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

  int? doctorId;

  void setId({required int id}) {
    doctorId = id;
  }

  TextEditingController firstName = TextEditingController();
  TextEditingController middleName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController phone = TextEditingController(text: "+963 ");
  TextEditingController description = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController dayInAdvance = TextEditingController();
  TextEditingController duration = TextEditingController();
  TextEditingController section = TextEditingController();
  late int sectionId;
  String? image;

  DoctorModel? doctorModel;

  Future<void> getDoctorProfile({required int id}) async {
    emit(LoadingGetDoctor());
    await _repo.getProfile(id: id).then((value) {
      value.fold((error) {
        emit(ErrorGetDoctor(error));
      }, (doctor) {
        firstName.text = doctor.userData.firstName;
        middleName.text = doctor.userData.middleName;
        lastName.text = doctor.userData.lastName;
        phone.text = doctor.userData.phoneNumber;
        description.text = doctor.userData.description;
        dayInAdvance.text = doctor.daysInAdvance.toString();
        duration.text = doctor.sessionDuration.toString();
        section.text = doctor.section!.sectionName.toString();
        sectionId = doctor.section!.id;
        image = doctor.userData.image;
        doctorModel = doctor;
        emit(SuccessGetDoctor());
      });
    });
  }

  void editingToggle() {
    isEditing = !isEditing;
    emit(EditingToggleProfileState());
  }

  void cancelEditing() {
    getDoctorProfile(id: doctorId!);
    isEditing = false;
    emit(CancelEditingState());
  }

  ///Sections for update
  List<String>? sectionsName;
  List<Map<String, int>> sections = [];

  void getSections({required context}) {
    AddAccountCubit.get(context).getSection();
    sectionsName = AddAccountCubit.get(context).SectionNames;
    sections = AddAccountCubit.get(context).Sections;
    emit(GetSectionState());
  }

  void selectSectionId({required int id}) {
    sectionId = id;
    emit(SelectSectionState());
  }

  ///

  Future<void> updateProfile() async {
    emit(LoadingUpdateDoctor());
    return _repo
        .updateProfile(
      id: doctorId!,
      firstName: firstName.text,
      middleName: middleName.text,
      lastName: lastName.text,
      phoneNumber: phone.text,
      description: description.text,
      sectionId: sectionId.toString(),
      sessionDuration: duration.text,
      dayInAdvanced: dayInAdvance.text,
      //   Working_hour: ""
    )
        .then((value) {
      value.fold((error) {
        emit(ErrorUpdateDoctor(error));
      }, (doctorModel) {
        isEditing = false;
        emit(SuccessUpdateDoctor());
      });
    });
  }

  Future<void> addDoctorSchedule() async {
    emit(LoadingPostSchedule());
    await _repo.postDoctorSchedule(id: doctorId!).then((value) {
      value.fold((error) {
        emit(ErrorPostSchedule(error));
      }, (map) {
        emit(SuccessPostSchedule());
      });
    });
  }

  List<ScheduleModel> workingHours = [];
  Future<void> getDoctorSchedule() async {
    emit(LoadingGetSchedule());
    workingHours = [];
    await _repo.getDoctorSchedule(id: doctorId!).then((value) {
      value.fold((error) {
        emit(Error_Get_Schedule(error));
      }, (workingMap) {
        workingMap.forEach((day, times) {
          ScheduleModel scheduleModel = ScheduleModel(day, times);
          workingHours.add(scheduleModel);
        });
        emit(SuccessGetSchedule());
      });
    });
  }
}
