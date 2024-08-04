import 'dart:typed_data'; // For Uint8List
import 'package:file_picker/file_picker.dart'; // For file picker functionality
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; // For Bloc
import 'package:dashboad/features/session/domain/repositories/session_repository.dart';
import 'package:dashboad/features/session/presentation/cubit/session_state.dart';
import 'package:progress_state_button/progress_button.dart';
import '../../data/model/session_model.dart';

class SessionCubit extends Cubit<SessionState> {

  SessionCubit(this._repo) : super(SessionInitial());

  final SessionRepository _repo ;
  List<Session> sessions =[] ;
  ButtonState addSessionButtonState = ButtonState.idle;

  Future<void> getOpenSession()async{
    emit(GetOpenSessionLoadingState());
    final response = await _repo.getOpenSessionForAPatient(1);
    response.fold((error){
      emit(GetOpenSessionErrorState(error.toString())) ;
    }, (data)async{
      List<Session> sessionsList = data.list.map((sessions)=>sessions as Session).toList();
      sessions = sessionsList ;
      emit(GetOpenSessionSuccessState(sessions));
    });
  }

  Future<void> addSession(BuildContext context) async{
    final response = await _repo.addSession(1) ;
    response.fold((error){
      debugPrint(error.toString());
      addSessionButtonState = ButtonState.idle;
      emit(AddSessionError(error.toString()));
    }, (data){
      debugPrint('success $data');
      addSessionButtonState = ButtonState.success ;
      emit(AddSessionSuccess()) ;
      getOpenSession();
    });
  }

  Future<void> closeSession(int sessionId)async{
    debugPrint('close session to api ');
     final response = await _repo.closeSession(sessionId);
     response.fold((error){
       debugPrint(error.toString());
       emit(CloseSessionError(error.toString()));
     }, (data){
       debugPrint('success $data') ;
       emit(CloseSessionSuccess());
       getOpenSession();
     });
  }

  Future<void> uploadFile(int sessionId) async {
    debugPrint('enter uploading file button');
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      debugPrint('file or result not null');
      try {
        Uint8List? fileBytes = result.files.single.bytes;
        String fileName = result.files.single.name;
        debugPrint('file bytes obtained: $fileBytes');
        debugPrint('file name: $fileName');

        if (fileBytes != null) {
          await _uploadFileWeb(fileBytes, fileName, sessionId);
        } else {
          emit(FileUploadErrorState('No file data available.'));
        }
      } catch (e) {
        debugPrint('file handling error: $e');
        emit(FileUploadErrorState('File handling error: $e'));
      }
    } else {
      debugPrint('No file selected');
      emit(FileUploadErrorState('No file selected.'));
    }
  }

  Future<void> _uploadFileWeb(Uint8List fileBytes, String fileName, int sessionId) async {
    try {
      final response = await _repo.uploadFile(fileBytes, fileName, sessionId);
      debugPrint('File uploaded successfully: $response');
     // emit(FileUploadSuccessState(response.toString()));
      final updatedSessions = await _repo.getOpenSessionForAPatient(1);
      updatedSessions.fold((error) {
        emit(FileUploadErrorState(error.toString()));
      }, (data) {
        sessions = data.list.map((sessions) => sessions as Session).toList();
        emit(GetOpenSessionSuccessState(sessions));
        emit(FileUploadSuccessState(response.toString()));
      }) ;
    } catch (e) {
      debugPrint('Upload failed: $e');
      emit(FileUploadErrorState('Upload failed: $e'));
    }
  }

  void updateSession(String id, String newDoctorName, String newDate, ) async{

    }
  }
