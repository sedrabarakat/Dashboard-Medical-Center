part of 'director_cubit.dart';

abstract class DirectorState {}

class DirectorInitialState extends DirectorState {}

class GetDirectorsLoadingState extends DirectorState {}

class GetDirectorsSuccessState extends DirectorState {
  List<UserModel> directors;
  GetDirectorsSuccessState(this.directors);
}

class GetDirectorsErrorState extends DirectorState {
  NetworkExceptions error;
  GetDirectorsErrorState(this.error);
}

class DeleteDirectorSuccessState extends DirectorState {
  List<UserModel> directors;
  DeleteDirectorSuccessState(this.directors);
}

class DeleteDirectorErrorState extends DirectorState {
  NetworkExceptions error;
  DeleteDirectorErrorState(this.error);
}
