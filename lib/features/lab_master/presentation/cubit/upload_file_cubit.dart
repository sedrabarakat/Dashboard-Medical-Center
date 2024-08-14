import 'dart:typed_data';

import 'package:dashboad/core/domain/error_handler/network_exceptions.dart';
import 'package:dashboad/features/lab_master/domain/repositories/lab_repo.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mime/mime.dart';

part 'upload_file_state.dart';

class UploadFileCubit extends Cubit<UploadFileState> {
  final LabRepo _repo;
  UploadFileCubit(this._repo) : super(UploadFileCubitInitialState());

  Uint8List? pickedFile;
  String? fileType;

  Future<void> uploadFile(
      int sessionDetailsId, String fileName, BuildContext context) async {
    final result = await _repo.uploadFile(
        sessionDetailsId: sessionDetailsId,
        file: pickedFile!,
        fileType: fileType!,
        fileName: fileName,
        context: context);
    result.fold((error) {
      emit(UploadFileErrorState(error));
    }, (data) {
      emit(UploadFileSuccessState(data.message));
    });
  }

  void uploadingFileProgress(double progress) {
    emit(UploadingFileState(progress / 100));
  }

  Future<void> pickFile(int sessionDetailsId, BuildContext context) async {
    await FilePicker.platform.pickFiles().then((result) {
      if (result != null) {
        final file = result.files.first;
        pickedFile = file.bytes;
        fileType = lookupMimeType(result.names[0]!)!.split('/')[1];
        uploadFile(sessionDetailsId, result.names[0]!, context);
      }
    });
  }
}
