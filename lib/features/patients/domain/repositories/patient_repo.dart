import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:dashboad/core/data/models/base_model.dart';
import 'package:dashboad/core/domain/error_handler/network_exceptions.dart';

import 'package:dashboad/features/patients/data/datasources/patient_remote_data_source.dart';
import 'package:flutter/cupertino.dart';

import '../../data/models/patient_model.dart';

class PatientRepo {
  final PatientRemoteDataSource _remote;
  PatientRepo(this._remote);
  Future<Either<NetworkExceptions, BaseModels>> getPatients() async {
    try {
      final response = await _remote.getPatients();
      print("_______________________");
      return right(response);
    } catch (error) {
      return left(NetworkExceptions.getException(error));
    }
  }

  Future<Either<NetworkExceptions, Unit>> deletePatient(int id) async {
    try {
      await _remote.deletePatient(id);
      return right(unit);
    } catch (error) {
      return left(NetworkExceptions.getException(error));
    }
  }

  Future<Either<NetworkExceptions, PatientModel>> getPatientProfile ({
    required int id,
})async{
    try{
      BaseModel baseModel=await _remote.getPatientProfile(id: id);
      PatientModel patientModel=PatientModel.fromJson(baseModel.data);
      return right(patientModel);
  }
  catch(error){
    return left(NetworkExceptions.getException(error));
  }
}

  Future<Either<NetworkExceptions, PatientModel>>updatePatientProfile({
    required int id,
    required String first_name,
    required String middle_name,
    required String last_name,
    required String phone_number,
    required String description,
    required String birth_date,
    required String age,
    required String gender,
    required String address,
    required String bloodType,
    required String marital_status,
    required int children_num,
    required String habits,
    required String profession,
    required bool diabetes,
    required bool blood_pressure,
    required int wallet,
    var image
  })async{
    try{
      BaseModel baseModel=await _remote.updatePatientProfile(
          id: id,
          first_name: first_name,
          middle_name: middle_name,
          last_name: last_name,
          phone_number: phone_number,
          description: description,
          birth_date: birth_date,
          age: age,
          gender: gender,
          address: address,
          bloodType: bloodType,
          marital_status: marital_status,
          children_num: children_num,
          habits: habits,
          profession: profession,
          diabetes: diabetes,
          blood_pressure: blood_pressure,
          wallet: wallet,
          image: image);
      PatientModel patientModel=PatientModel.fromJson(baseModel.data);
      return right(patientModel);
    }
    catch(error){
      return left(NetworkExceptions.getException(error));
    }
  }


  ///////////////////* Sessions *//////////////////////

  Future<Either<NetworkExceptions, Unit>> addSession(int patientId) async{
    try{
      _remote.addSession(patientId) ;
      return right(unit) ;
    }catch(exception){
      return left(NetworkExceptions.getException(exception));
    }
  }
  Future<Either<NetworkExceptions, Unit>> closeSession(int sessionId )async{
    try{
      _remote.closeSession(sessionId) ;
      return right(unit) ;
    }catch(exception){
      return left(NetworkExceptions.getException(exception));
    }
  }
  Future<Either<NetworkExceptions, BaseModels>> getOpenSessionForAPatient(int patientId)async{
    try{
      debugPrint('here you are in session repository try 11111111111111111111111111111');
      final response = await _remote.getOpenSession(patientId);
      debugPrint('here you are in session repository try 11111111111111111111111111111');
      return right(response);
    }catch(exception){
      debugPrint('here you are in session repository catch 11111111111111111111111111111$exception');
      return left(NetworkExceptions.getException(exception));
    }
  }
  Future<Either<NetworkExceptions, Unit>> uploadFile(Uint8List fileBytes,String fileName,  int sessionId)async{
    try{

      _remote.uploadFile(fileBytes, fileName, sessionId) ;
      return right(unit) ;
    }catch(exception){
      return left(NetworkExceptions.getException(exception)) ;
    }
  }


}
