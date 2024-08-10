import 'dart:typed_data';
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
  TextEditingController firstName = TextEditingController();
  TextEditingController middleName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController birthDate = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController bloodType = TextEditingController();
  TextEditingController matrialStatus = TextEditingController();
  TextEditingController childrenNum = TextEditingController();
  TextEditingController habit = TextEditingController();
  TextEditingController profession = TextEditingController();
  TextEditingController wallet = TextEditingController();
  TextEditingController gender = TextEditingController();
  TextEditingController diabets = TextEditingController();
  TextEditingController pressure = TextEditingController();
  String? image;

  late int patientId;

  void setId({required int id}) {
    patientId = id;
  }

  bool isEditing = false;

  void editingToggle() {
    isEditing = !isEditing;
    emit(EditingToggleProfileState());
  }

  void cancelEditing() {
    getPatientProfile(id: patientId);
    isEditing = false;
    emit(CancelEditingState());
  }

  PatientModel? patientModel;

  Future<void> getPatientProfile({required int id}) async {
    patientModel = null;
    emit(LoadingGetProfileState());
    final response = await _repo.getPatientProfile(id: id);
    response.fold((e) {
      emit(ErrorGetProfileState());
    }, (patient) async {
      patientModel = patient;

      firstName.text = patient.userData.firstName;
      middleName.text = patient.userData.middleName;
      lastName.text = patient.userData.lastName;
      phone.text = patient.userData.phoneNumber;
      description.text = patient.userData.description;
      birthDate.text =
          DateHelper.Convert_DateTime_DashString(dateTime: patient.birthDate);
      age.text = patient.age;
      address.text = patient.address;
      bloodType.text = patient.bloodType;
      matrialStatus.text = patient.maritalStatus;
      childrenNum.text = patient.childrenNum.toString();
      habit.text = patient.habits ?? "";
      profession.text = patient.proffesion;
      wallet.text = patient.wallet.toString();
      gender.text = patient.gender.toString();
      diabets.text = (patient.diabetes == 1) ? "Have" : "Haven't";
      pressure.text = (patient.bloodPressure == 1) ? "Have" : "Haven't";
      image = patient.userData.image;
      await getOpenSession(id: id);
      emit(SuccessGetProfileState());
    });
    // return await _repo.getPatientProfile(id: id).then((val) {
    //   val.fold((error) {
    //     emit(ErrorGetProfileState());
    //   }, (patient) {
    //     patientModel = patient;

    //     firstName.text = patient.userData.firstName;
    //     middleName.text = patient.userData.middleName;
    //     lastName.text = patient.userData.lastName;
    //     phone.text = patient.userData.phoneNumber;
    //     description.text = patient.userData.description;
    //     birthDate.text =
    //         DateHelper.Convert_DateTime_DashString(dateTime: patient.birthDate);
    //     age.text = patient.age;
    //     address.text = patient.address;
    //     bloodType.text = patient.bloodType;
    //     matrialStatus.text = patient.maritalStatus;
    //     childrenNum.text = patient.childrenNum.toString();
    //     habit.text = patient.habits;
    //     profession.text = patient.proffesion;
    //     wallet.text = patient.wallet.toString();
    //     gender.text = patient.gender.toString();
    //     diabets.text = (patient.diabetes == 1) ? "Have" : "Haven't";
    //     pressure.text = (patient.bloodPressure == 1) ? "Have" : "Haven't";
    //     image = patient.userData.image;
    //     emit(SuccessGetProfileState());
    //   });
    // });
  }

  Future<void> updateProfile() async {
    emit(LoadingUpdateProfileState());
    final response = await _repo.updatePatientProfile(
      id: patientId,
      firstName: firstName.text,
      middleName: middleName.text,
      lastName: lastName.text,
      phoneNumber: phone.text,
      description: description.text,
      birthDate: birthDate.text,
      age: age.text,
      gender: gender.text,
      address: address.text,
      bloodType: bloodType.text,
      martialStatus: matrialStatus.text,
      childrenNum: int.parse(childrenNum.text),
      habits: habit.text,
      profession: profession.text,
      diabetes: patientModel!.diabetes,
      bloodPressure: patientModel!.bloodPressure,
      wallet: int.parse(wallet.text),
    );
    response.fold((error) {
      emit(ErrorUpdateProfileState());
    }, (patient) {
      isEditing = false;
      int patientIndex = _patients.indexWhere((p) => p.id == patient.id);
      _patients.removeAt(patientIndex);
      _patients.insert(patientIndex, patient);
      SharedPrefrence.saveListOfObject(_patients, 'sections');

      emit(SuccessUpdateProfileState());
      emit(GetPatientSuccessState(_patients));
    });
  }

  //////////////////////* Sessions *//////////////////////
  List<Session> sessions = [];
  ButtonState addSessionButtonState = ButtonState.idle;

  Future<void> getOpenSession({required int id}) async {
    emit(GetOpenSessionLoadingState());
    final response = await _repo.getOpenSessionForAPatient(id);
    response.fold((error) {
      emit(GetOpenSessionErrorState(error.toString()));
    }, (data) async {
      List<Session> sessionsList =
          data.list.map((sessions) => sessions as Session).toList();
      sessions = sessionsList;
      emit(GetOpenSessionSuccessState(sessions));
    });
  }

  Future<void> addSession(BuildContext context, int id) async {
    final response = await _repo.addSession(id);
    response.fold((error) {
      debugPrint(error.toString());
      addSessionButtonState = ButtonState.idle;
      emit(AddSessionError(error.toString()));
    }, (data) {
      debugPrint('success $data');
      addSessionButtonState = ButtonState.success;
      emit(AddSessionSuccess());
      getOpenSession(id: id);
    });
  }

  Future<void> closeSession(int sessionId, int patientId) async {
    debugPrint('close session to api ');
    final response = await _repo.closeSession(sessionId);
    response.fold((error) {
      debugPrint(error.toString());
      emit(CloseSessionError(error.toString()));
    }, (data) {
      debugPrint('success $data');
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

  Future<void> _uploadFileWeb(
      Uint8List fileBytes, String fileName, int sessionId) async {
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
      });
    } catch (e) {
      debugPrint('Upload failed: $e');
      emit(FileUploadErrorState('Upload failed: $e'));
    }
  }
}
