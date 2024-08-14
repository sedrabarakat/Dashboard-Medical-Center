part of 'lab_cubit.dart';

abstract class LabState {}

class LabInitialState extends LabState {}

class GetLabRequetLoadingState extends LabState {}

class GetLabRequestErrorState extends LabState {
  final NetworkExceptions error;
  GetLabRequestErrorState(this.error);
}

class GetLabRequestSuccessState extends LabState {
  final List<RequestModel> requests;
  GetLabRequestSuccessState(this.requests);
}

class MakeItDoneSuccessState extends LabState {
  final String message;
  MakeItDoneSuccessState(this.message);
}

class MakeItDoneErrorState extends LabState {
  final NetworkExceptions error;
  MakeItDoneErrorState(this.error);
}

class MakeItFailSuccessState extends LabState {
  final String message;
  MakeItFailSuccessState(this.message);
}

class MakeItFailErrorState extends LabState {
  final NetworkExceptions error;
  MakeItFailErrorState(this.error);
}
