import 'package:bloc/bloc.dart';
import 'package:dashboad/core/data/datasources/local.dart';
import 'package:dashboad/core/domain/error_handler/network_exceptions.dart';
import 'package:dashboad/core/helpers/json_helper.dart';
import 'package:dashboad/core/widgets/toast_bar.dart';
import 'package:dashboad/features/patients/data/models/patient_model.dart';
import 'package:dashboad/features/patients/domain/repositories/patient_repo.dart';
import 'package:flutter/material.dart';

part 'patient_state.dart';

class PatientCubit extends Cubit<PatientState> {
  final PatientRepo _repo;
  PatientCubit(this._repo) : super(PatientInitialState());
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
}
