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
