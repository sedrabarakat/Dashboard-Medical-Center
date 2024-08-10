import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:dashboad/core/data/models/base_model.dart';
import 'package:dashboad/core/domain/error_handler/network_exceptions.dart';

import 'package:dashboad/features/patients/data/datasources/patient_remote_data_source.dart';
import 'package:dashboad/features/patients/data/models/patient_model.dart';
import 'package:flutter/cupertino.dart';

class PatientRepo {
  final PatientRemoteDataSource _remote;
  PatientRepo(this._remote);
  Future<Either<NetworkExceptions, BaseModels>> getPatients() async {
    try {
      final response = await _remote.getPatients();
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

  Future<Either<NetworkExceptions, PatientModel>> getPatientProfile({
    required int id,
  }) async {
    try {
      BaseModel baseModel = await _remote.getPatientProfile(id: id);
      PatientModel patientModel = PatientModel.fromJson(baseModel.data);
      return right(patientModel);
    } catch (error) {
      return left(NetworkExceptions.getException(error));
    }
  }

  Future<Either<NetworkExceptions, PatientModel>> updatePatientProfile(
      {required int id,
      required String firstName,
      required String middleName,
      required String lastName,
      required String phoneNumber,
      required String description,
      required String birthDate,
      required String age,
      required String gender,
      required String address,
      required String bloodType,
      required String martialStatus,
      required int childrenNum,
      required String habits,
      required String profession,
      required int diabetes,
      required int bloodPressure,
      required int wallet,
      var image}) async {
    try {
      BaseModel baseModel = await _remote.updatePatientProfile(
          id: id,
          firstName: firstName,
          middleName: middleName,
          lastName: lastName,
          phoneNumber: phoneNumber,
          description: description,
          birthDate: birthDate,
          age: age,
          gender: gender,
          address: address,
          bloodType: bloodType,
          maritalStatus: martialStatus,
          childrenNum: childrenNum,
          habits: habits,
          profession: profession,
          diabetes: diabetes,
          bloodPressure: bloodPressure,
          wallet: wallet,
          image: image);
      PatientModel patientModel = PatientModel.fromJson(baseModel.data);
      return right(patientModel);
    } catch (error) {
      return left(NetworkExceptions.getException(error));
    }
  }

  ///////////////////* Sessions *//////////////////////

  Future<Either<NetworkExceptions, Unit>> addSession(int patientId) async {
    try {
      _remote.addSession(patientId);
      return right(unit);
    } catch (exception) {
      return left(NetworkExceptions.getException(exception));
    }
  }

  Future<Either<NetworkExceptions, Unit>> closeSession(int sessionId) async {
    try {
      _remote.closeSession(sessionId);
      return right(unit);
    } catch (exception) {
      return left(NetworkExceptions.getException(exception));
    }
  }

  Future<Either<NetworkExceptions, BaseModels>> getOpenSessionForAPatient(
      int patientId) async {
    try {
      debugPrint(
          'here you are in session repository try 11111111111111111111111111111');
      final response = await _remote.getOpenSession(patientId);
      debugPrint(
          'here you are in session repository try 11111111111111111111111111111');
      return right(response);
    } catch (exception) {
      debugPrint(
          'here you are in session repository catch 11111111111111111111111111111$exception');
      return left(NetworkExceptions.getException(exception));
    }
  }

  Future<Either<NetworkExceptions, Unit>> uploadFile(
      Uint8List fileBytes, String fileName, int sessionId) async {
    try {
      _remote.uploadFile(fileBytes, fileName, sessionId);
      return right(unit);
    } catch (exception) {
      return left(NetworkExceptions.getException(exception));
    }
  }
}
