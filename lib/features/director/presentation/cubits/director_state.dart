part of 'director_cubit.dart';

@freezed
// class DirectorState with _$DirectorState {
//   const factory DirectorState.initial() = _Initial;
//   const factory DirectorState.directorsLoading() = _DirectorsLoading;
//   const factory DirectorState.directorsSuccess(List<UserModel> directors) =
//       _DirectorsSuccess;
//   const factory DirectorState.directorsFailure(
//       NetworkExceptions networkException) = _DirectorsFailure;
//   const factory DirectorState.deleteDirectorSuccess(List<UserModel> directors) =
//       _DeleteDirectorSuccess;
//   const factory DirectorState.deleteDirectorFailure(NetworkExceptions error) =
//       _DeleteDirectorFailure;
// }

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
