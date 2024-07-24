part of 'reseption_cubit.dart';

abstract class ReseptionState {}

class ReseptionInitialState extends ReseptionState {}

class GetReseptionsLoadingState extends ReseptionState {}

class GetReseptionsSuccessState extends ReseptionState {
  List<UserModel> reseptions;
  GetReseptionsSuccessState(this.reseptions);
}

class GetReseptionsErrorState extends ReseptionState {
  NetworkExceptions error;
  GetReseptionsErrorState(this.error);
}

class DeleteReseptionSuccessState extends ReseptionState {
  List<UserModel> reseptions;
  DeleteReseptionSuccessState(this.reseptions);
}

class DeleteReseptionErrorState extends ReseptionState {
  NetworkExceptions error;
  DeleteReseptionErrorState(this.error);
}
