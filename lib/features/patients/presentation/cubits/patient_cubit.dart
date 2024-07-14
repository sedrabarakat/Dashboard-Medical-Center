import 'package:bloc/bloc.dart';
import 'package:dashboad/core/domain/error_handler/network_exceptions.dart';
import 'package:dashboad/core/widgets/constants.dart';
import 'package:dashboad/features/patients/data/models/patient_model.dart';
import 'package:dashboad/features/patients/domain/repositories/patient_repo.dart';
import 'package:flutter/material.dart';

part 'patient_state.dart';

class PatientCubit extends Cubit<PatientState> {
  final PatientRepo _repo;
  PatientCubit(this._repo) : super(PatientInitialState());
  List<PatientModel> _patients = [];
  Future<void> getPatients() async {
    emit(GetPatientsLoadingState());
    final response = await _repo.getPatients();
    response.fold((error) {
      emit(GetPatientsErrorState(error));
    }, (data) {
      List<PatientModel> listOfPatients =
          data.list.map((patient) => patient as PatientModel).toList();
      _patients = listOfPatients;
      emit(GetPatientSuccessState(_patients));
    });
  }

  Future<void> deletePatient(BuildContext context, int id) async {
    PatientModel removedPatient =
        _patients.firstWhere((patient) => patient.id == id);
    _patients.removeWhere((patient) => patient.id == id);
    final response = await _repo.deletePatient(id);
    response.fold((error) {
      Constants.onNetworkFailure(context,
          networkException: error, title: "Error");
      _patients.add(removedPatient);
      emit(DeletePatientErrorState(error));
    }, (unit) {
      emit(
        DeletePatientSuccessState(_patients),
      );
    });
  }
}
