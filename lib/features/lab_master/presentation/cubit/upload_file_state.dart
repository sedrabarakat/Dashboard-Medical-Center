part of 'upload_file_cubit.dart';

abstract class UploadFileState {}

class UploadFileCubitInitialState extends UploadFileState {}

class UploadFileLoadingState extends UploadFileState {}

class UploadFileSuccessState extends UploadFileState {
  final String message;
  UploadFileSuccessState(this.message);
}

class UploadFileErrorState extends UploadFileState {
  final NetworkExceptions error;
  UploadFileErrorState(this.error);
}

class UploadingFileState extends UploadFileState {
  final double value;
  UploadingFileState(this.value);
}
