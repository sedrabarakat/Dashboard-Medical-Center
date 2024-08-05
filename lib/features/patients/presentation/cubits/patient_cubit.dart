import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:dashboad/core/data/datasources/local.dart';
import 'package:dashboad/core/domain/error_handler/network_exceptions.dart';
import 'package:dashboad/core/helpers/date_helper.dart';
import 'package:dashboad/core/helpers/json_helper.dart';
import 'package:dashboad/core/widgets/toast_bar.dart';
import 'package:dashboad/features/patients/data/models/patient_model.dart';
import 'package:dashboad/features/patients/domain/repositories/patient_repo.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:progress_state_button/progress_button.dart';

import '../../data/models/session_model.dart';

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

  bool isEditing = false;

  void editingToggle() {
    isEditing = !isEditing;
    emit(Editing_ToggleProfile_State());
  }

  void cancelEditing() {
    isEditing = false;
    emit(Editing_ToggleProfile_State());
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
        Middle_name.text="hhh";
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

  Future<void> updatePatientProfile({
    required int id,
  }) async {
    emit(Loading_UpdateProfile_State());
    return await _repo.updatePatientProfile(
        id: id,
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
        diabetes: bool.parse(Diabets.text),
        blood_pressure: bool.parse(Pressure.text),
        wallet: int.parse(wallet.text),
        ).then((value){
          value.fold((error){
           emit(Error_UpdateProfile_State());
          }, (PatientModel){
           emit(Success_UpdateProfile_State());
          });
    });
  }



  //////////////////////* Sessions *//////////////////////
  List<Session> sessions =[] ;
  ButtonState addSessionButtonState = ButtonState.idle;

  Future<void> getOpenSession({required int id})async{
    emit(GetOpenSessionLoadingState());
    final response = await _repo.getOpenSessionForAPatient(id);
    response.fold((error){
      emit(GetOpenSessionErrorState(error.toString())) ;
    }, (data)async{
      List<Session> sessionsList = data.list.map((sessions)=>sessions as Session).toList();
      sessions = sessionsList ;
      emit(GetOpenSessionSuccessState(sessions));
    });
  }

  Future<void> addSession(BuildContext context, int id) async{
    final response = await _repo.addSession(id) ;
    response.fold((error){
      debugPrint(error.toString());
      addSessionButtonState = ButtonState.idle;
      emit(AddSessionError(error.toString()));
    }, (data){
      debugPrint('success $data');
      addSessionButtonState = ButtonState.success ;
      emit(AddSessionSuccess()) ;
      getOpenSession(id: id);
    });
  }

  Future<void> closeSession(int sessionId, int patientId)async{
    debugPrint('close session to api ');
    final response = await _repo.closeSession(sessionId);
    response.fold((error){
      debugPrint(error.toString());
      emit(CloseSessionError(error.toString()));
    }, (data){
      debugPrint('success $data') ;
      emit(CloseSessionSuccess());
      getOpenSession(id: patientId);
    });
  }

  Future<void> uploadFile(int sessionId) async {
    debugPrint('enter uploading file button');
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      debugPrint('file or result not null');
      try {
        Uint8List? fileBytes = result.files.single.bytes;
        String fileName = result.files.single.name;
        debugPrint('file bytes obtained: $fileBytes');
        debugPrint('file name: $fileName');

        if (fileBytes != null) {
          await _uploadFileWeb(fileBytes, fileName, sessionId);
        } else {
          emit(FileUploadErrorState('No file data available.'));
        }
      } catch (e) {
        debugPrint('file handling error: $e');
        emit(FileUploadErrorState('File handling error: $e'));
      }
    } else {
      debugPrint('No file selected');
      emit(FileUploadErrorState('No file selected.'));
    }
  }

  Future<void> _uploadFileWeb(Uint8List fileBytes, String fileName, int sessionId) async {
    try {
      final response = await _repo.uploadFile(fileBytes, fileName, sessionId);
      debugPrint('File uploaded successfully: $response');
      // emit(FileUploadSuccessState(response.toString()));
      final updatedSessions = await _repo.getOpenSessionForAPatient(1);
      updatedSessions.fold((error) {
        emit(FileUploadErrorState(error.toString()));
      }, (data) {
        sessions = data.list.map((sessions) => sessions as Session).toList();
        emit(GetOpenSessionSuccessState(sessions));
        emit(FileUploadSuccessState(response.toString()));
      }) ;
    } catch (e) {
      debugPrint('Upload failed: $e');
      emit(FileUploadErrorState('Upload failed: $e'));
    }
  }


}
