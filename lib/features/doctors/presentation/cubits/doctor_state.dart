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

class Loading_Get_Doctor extends DoctorState{}
class Success_Get_Doctor extends DoctorState{}
class Error_Get_Doctor extends DoctorState{
  NetworkExceptions error;
  Error_Get_Doctor(this.error);
}
class Editing_ToggleProfile_State extends DoctorState{}

class Cancel_Editing_State extends DoctorState{}

class Get_Section_State extends DoctorState{}

class Loading_Update_Doctor extends DoctorState{}
class Success_Update_Doctor extends DoctorState{}
class Error_Update_Doctor extends DoctorState{
  NetworkExceptions error;
  Error_Update_Doctor(this.error);
}

class Select_Sections_State extends DoctorState{}

class Loading_Post_Schedule extends DoctorState{}
class Success_Post_Schedule extends DoctorState{}
class Error_Post_Schedule extends DoctorState{
  NetworkExceptions error;
  Error_Post_Schedule(this.error);
}

class Loading_Get_Schedule extends DoctorState{}
class Success_Get_Schedule extends DoctorState{}
class Error_Get_Schedule extends DoctorState{
  NetworkExceptions error;
  Error_Get_Schedule(this.error);
}