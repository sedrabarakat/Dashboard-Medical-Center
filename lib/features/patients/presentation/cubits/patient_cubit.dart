import 'package:bloc/bloc.dart';
import 'package:dashboad/core/data/datasources/local.dart';
import 'package:dashboad/core/domain/error_handler/network_exceptions.dart';
import 'package:dashboad/core/helpers/date_helper.dart';
import 'package:dashboad/core/helpers/json_helper.dart';
import 'package:dashboad/core/widgets/toast_bar.dart';
import 'package:dashboad/features/patients/data/models/patient_model.dart';
import 'package:dashboad/features/patients/domain/repositories/patient_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'patient_state.dart';

class PatientCubit extends Cubit<PatientState> {
  final PatientRepo _repo;

  PatientCubit(this._repo) : super(PatientInitialState());

  static PatientCubit get(context) => BlocProvider.of(context);
  List<PatientModel> _patients = [];

  Future<void> getPatients() async {
    List<String> patientCachedList =
    await SharedPrefrence.getListOfString('patients');
    // Check if there is cached data if true then return the cached data
    if (patientCachedList.isNotEmpty) {
      _patients = JsonHelper.convertListOfStringToListOfObjects<PatientModel>(
        patientCachedList,
        PatientModel.fromJson,
      );
      emit(GetPatientSuccessState(_patients));
      return;
    }
    emit(GetPatientsLoadingState());

    final response = await _repo.getPatients();
    response.fold((error) {
      emit(GetPatientsErrorState(error));
    }, (data) {
      List<PatientModel> listOfPatients =
      data.list.map((patient) => patient as PatientModel).toList();
      _patients = listOfPatients;
      SharedPrefrence.saveListOfObject(_patients, 'patients');
      emit(GetPatientSuccessState(_patients));
    });
  }

  Future<void> deletePatient(BuildContext context, int id) async {
    PatientModel removedPatient =
    _patients.firstWhere((patient) => patient.id == id);
    _patients.removeWhere((patient) => patient.id == id);
    final response = await _repo.deletePatient(id);
    response.fold((error) {
      ToastBar.onNetworkFailure(context,
          networkException: error, title: "Error");
      _patients.add(removedPatient);
      emit(DeletePatientErrorState(error));
    }, (unit) {
      SharedPrefrence.saveListOfObject(_patients, 'patients');
      emit(
        DeletePatientSuccessState(_patients),
      );
    });
  }

  ///profiles
  var First_name = TextEditingController();
  var Middle_name = TextEditingController();
  var Last_name = TextEditingController();
  var Phone = TextEditingController();
  var Description = TextEditingController();

  var Birth_Date = TextEditingController();
  var Age = TextEditingController();
  var Address = TextEditingController();
  var Blood_Type = TextEditingController();
  var Matrial_Status = TextEditingController();
  var Children_num = TextEditingController();
  var Habit = TextEditingController();
  var profession = TextEditingController();
  var wallet = TextEditingController();
  var Gender = TextEditingController();
  var Diabets = TextEditingController();
  var Pressure = TextEditingController();
  var image;

  var Patient_id;

  void setId({required int id}){
    Patient_id=id;
    print(Patient_id);
  }

  bool isEditing = false;

  void editingToggle() {
    isEditing = !isEditing;
    emit(Editing_ToggleProfile_State());
  }

  void cancelEditing() {
    getPatientProfile(id: Patient_id);
    isEditing = false;
    emit(Cancel_Editing_State());
  }

  PatientModel ? patientModel;

  Future<void> getPatientProfile({
    required int id
  }) async {
    emit(Loading_getProfile_State());
    return await _repo.getPatientProfile(id: id).then((val) {
      val.fold((error) {
        emit(Error_getProfile_State());
      }, (PatientModel) {
        patientModel = PatientModel;
        First_name.text = PatientModel.userData.firstName;
        Middle_name.text=PatientModel.userData.middleName;
        Last_name.text = PatientModel.userData.lastName;
        Phone.text = PatientModel.userData.phoneNumber;
        Description.text = PatientModel.userData.description;
        Birth_Date.text = DateHelper.Convert_DateTime_DashString(
            dateTime: PatientModel.birthDate);
        Age.text = PatientModel.age;
        Address.text = PatientModel.address;
        Blood_Type.text = PatientModel.bloodType;
        Matrial_Status.text = PatientModel.maritalStatus;
        Children_num.text = PatientModel.childrenNum.toString();
        Habit.text = PatientModel.habits;
        profession.text = PatientModel.proffesion;
        wallet.text = PatientModel.wallet.toString();
        Gender.text = PatientModel.gender.toString();
        Diabets.text = (PatientModel.diabetes == 1) ? "Have" : "Haven\'t";
        Pressure.text = (PatientModel.bloodPressure == 1) ? "Have" : "Haven\'t";
        image = PatientModel.userData.image;
        emit(Success_getProfile_State());
      });
    });
  }

  Future<void> updateProfile() async {
    emit(Loading_UpdateProfile_State());
    return await _repo.updatePatientProfile(
        id: Patient_id,
        first_name: First_name.text,
        middle_name: Middle_name.text,
        last_name: Last_name.text,
        phone_number: Phone.text,
        description: Description.text,
        birth_date: Birth_Date.text,
        age: Age.text,
        gender: Gender.text,
        address: Address.text,
        bloodType: Blood_Type.text,
        marital_status: Matrial_Status.text,
        children_num: int.parse(Children_num.text),
        habits: Habit.text,
        profession: profession.text,
        diabetes: patientModel!.diabetes ,
        blood_pressure: patientModel!.bloodPressure,
        wallet: int.parse(wallet.text),
        ).then((value){
          value.fold((error){
           emit(Error_UpdateProfile_State());
          }, (PatientModel){
            isEditing = false;
           emit(Success_UpdateProfile_State());
          });
    });
  }

}
