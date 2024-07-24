part of 'lab_master_cubit.dart';

abstract class LabMasterState {}

class LabMasterInitialState extends LabMasterState {}

class GetLabMasterLoadingState extends LabMasterState {}

class GetLabMasterSuccessState extends LabMasterState {
  List<UserModel> labMasters;
  GetLabMasterSuccessState(this.labMasters);
}

class GetLabMasterErrorState extends LabMasterState {
  NetworkExceptions error;
  GetLabMasterErrorState(this.error);
}

class DeleteLabMasterSuccessState extends LabMasterState {
  List<UserModel> labMasters;
  DeleteLabMasterSuccessState(this.labMasters);
}

class DeleteLabMasterErrorState extends LabMasterState {
  NetworkExceptions error;
  DeleteLabMasterErrorState(this.error);
}
