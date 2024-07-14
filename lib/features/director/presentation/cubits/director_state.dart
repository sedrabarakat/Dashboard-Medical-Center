part of 'director_cubit.dart';

@freezed
class DirectorState with _$DirectorState {
  const factory DirectorState.initial() = _Initial;
  const factory DirectorState.directorsLoading() = _DirectorsLoading;
  const factory DirectorState.directorsSuccess(List<UserModel> directors) =
      _DirectorsSuccess;
  const factory DirectorState.directorsFailure(
      NetworkExceptions networkException) = _DirectorsFailure;
  const factory DirectorState.deleteDirectorSuccess(List<UserModel> directors) =
      _DeleteDirectorSuccess;
  const factory DirectorState.deleteDirectorFailure(NetworkExceptions error) =
      _DeleteDirectorFailure;
}
