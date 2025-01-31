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

class LoadingGetProfileState extends PatientState {}

class SuccessGetProfileState extends PatientState {}

class ErrorGetProfileState extends PatientState {}

class EditingToggleProfileState extends PatientState {}

class LoadingUpdateProfileState extends PatientState {}

class SuccessUpdateProfileState extends PatientState {}

class ErrorUpdateProfileState extends PatientState {}

class CancelEditingState extends PatientState {}

////////////////////* Sessions state *//////////////////

final class GetOpenSessionLoadingState extends PatientState {}

final class GetOpenSessionSuccessState extends PatientState {
  final List<Session> sessions;
  GetOpenSessionSuccessState(this.sessions);
}

final class GetOpenSessionErrorState extends PatientState {
  final String error;

  GetOpenSessionErrorState(this.error);
}

final class AddSessionSuccess extends PatientState {}

final class AddSessionError extends PatientState {
  final String error;

  AddSessionError(this.error);
}

final class CloseSessionSuccess extends PatientState {}

final class CloseSessionError extends PatientState {
  final String error;

  CloseSessionError(this.error);
}

final class FileUploadSuccessState extends PatientState {
  final String response;
  FileUploadSuccessState(this.response);
}

final class FileUploadErrorState extends PatientState {
  final String error;
  FileUploadErrorState(this.error);
}
