part of 'patient_cubit.dart';

abstract class PatientState {}

class PatientInitialState extends PatientState {}

class GetPatientsLoadingState extends PatientState {}

class GetPatientSuccessState extends PatientState {
  List<PatientModel> patients;
  GetPatientSuccessState(this.patients);
}

class GetPatientsErrorState extends PatientState {
  NetworkExceptions error;
  GetPatientsErrorState(this.error);
}

class DeletePatientSuccessState extends PatientState {
  List<PatientModel> patients;
  DeletePatientSuccessState(this.patients);
}

class DeletePatientErrorState extends PatientState {
  NetworkExceptions error;
  DeletePatientErrorState(this.error);
}
