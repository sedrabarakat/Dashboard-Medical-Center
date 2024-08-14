import 'dart:typed_data';

import 'package:dashboad/features/lab_master/domain/repositories/lab_repo.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'upload_file_state.dart';

class UploadFileCubit extends Cubit<UploadFileState> {
  final LabRepo _repo;
  UploadFileCubit(this._repo) : super(UploadFileCubitInitialState());

  Uint8List? pickedFile;
  void pickSectionImage() async {
    final result = await FilePicker.platform.pickFiles();
    if (result != null) {
      final file = result.files.first;

      pickedFile = file.bytes;
    }
  }
}
