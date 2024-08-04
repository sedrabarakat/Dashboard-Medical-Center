import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:dashboad/core/data/models/base_model.dart';
import 'package:dashboad/core/domain/error_handler/network_exceptions.dart';
import 'package:dashboad/features/session/data/data_sources/remote/session_remote.dart';
import 'package:flutter/cupertino.dart';

class SessionRepository{
  final SessionRemoteDataSources _remoteDataSources ;

  SessionRepository(this._remoteDataSources);

  Future<Either<NetworkExceptions, Unit>> addSession(int patientId) async{
    try{
      _remoteDataSources.addSession(patientId) ;
      return right(unit) ;
    }catch(exception){
      return left(NetworkExceptions.getException(exception)); 
    }
  }
  Future<Either<NetworkExceptions, Unit>> closeSession(int sessionId )async{
    try{
      _remoteDataSources.closeSession(sessionId) ;
      return right(unit) ;
    }catch(exception){
      return left(NetworkExceptions.getException(exception));
    }
  }
  Future<Either<NetworkExceptions, BaseModels>> getOpenSessionForAPatient(int patientId)async{
    try{
      debugPrint('here you are in session repository try 11111111111111111111111111111');
      final response = await _remoteDataSources.getOpenSession(patientId);
      debugPrint('here you are in session repository try 11111111111111111111111111111');
      return right(response);
    }catch(exception){
      debugPrint('here you are in session repository catch 11111111111111111111111111111$exception');
      return left(NetworkExceptions.getException(exception));
    }
  }
  Future<Either<NetworkExceptions, Unit>> uploadFile(Uint8List fileBytes,String fileName,  int sessionId)async{
    try{

      _remoteDataSources.uploadFile(fileBytes, fileName, sessionId) ;
      return right(unit) ;
    }catch(exception){
      return left(NetworkExceptions.getException(exception)) ;
    }
  }

}