part of 'doctor_cubit.dart';

abstract class DoctorState {}

class DoctorInitialState extends DoctorState {}

class GetDoctorsLoadingState extends DoctorState {}

class GetDoctorsSuccessState extends DoctorState {
  List<DoctorModel> doctors;
  GetDoctorsSuccessState(this.doctors);
}

class GetDoctorsErrorState extends DoctorState {
  NetworkExceptions error;
  GetDoctorsErrorState(this.error);
}

class DeleteDoctorSuccessState extends DoctorState {
  List<DoctorModel> directors;
  DeleteDoctorSuccessState(this.directors);
}

class DeleteDoctorErrorState extends DoctorState {
  NetworkExceptions error;
  DeleteDoctorErrorState(this.error);
}

class LoadingGetDoctor extends DoctorState {}

class SuccessGetDoctor extends DoctorState {}

class ErrorGetDoctor extends DoctorState {
  NetworkExceptions error;
  ErrorGetDoctor(this.error);
}

class EditingToggleProfileState extends DoctorState {}

class CancelEditingState extends DoctorState {}

class GetSectionState extends DoctorState {}

class LoadingUpdateDoctor extends DoctorState {}

class SuccessUpdateDoctor extends DoctorState {}

class ErrorUpdateDoctor extends DoctorState {
  NetworkExceptions error;
  ErrorUpdateDoctor(this.error);
}

class SelectSectionState extends DoctorState {}

class LoadingPostSchedule extends DoctorState {}

class SuccessPostSchedule extends DoctorState {}

class ErrorPostSchedule extends DoctorState {
  NetworkExceptions error;
  ErrorPostSchedule(this.error);
}

class LoadingGetSchedule extends DoctorState {}

class SuccessGetSchedule extends DoctorState {}

class Error_Get_Schedule extends DoctorState {
  NetworkExceptions error;
  Error_Get_Schedule(this.error);
}
