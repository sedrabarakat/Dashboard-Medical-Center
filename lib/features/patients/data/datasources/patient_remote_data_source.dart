import 'dart:typed_data';

import 'package:dashboad/core/data/models/base_model.dart';
import 'package:dashboad/core/domain/services/api_service.dart';
import 'package:dashboad/core/domain/urls/app_url.dart';
import 'package:dashboad/features/patients/data/models/patient_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../models/session_model.dart';

class PatientRemoteDataSource {
  final ApiServices _apiServices;
  PatientRemoteDataSource(this._apiServices);
  Future<BaseModels> getPatients() async {
    final response = await _apiServices.get(AppUrl.getPatientsList);

    return BaseModels.fromJson(
        response['data'], (itemJson) => PatientModel.fromJson(itemJson));
  }

  Future<void> deletePatient(int id) async {
    await _apiServices.delete(
      "${AppUrl.deletePatient}$id",
    );
  }

  Future<BaseModel> getPatientProfile({required int id}) async {
    final response = await _apiServices.get("${AppUrl.getPatientProfile}$id");

    return BaseModel(data: response['data'], message: response['message']);
  }

  Future<BaseModel> updatePatientProfile(
      {required int id,
      String? firstName,
      String? middleName,
      String? lastName,
      String? phoneNumber,
      String? description,
      required String birthDate,
      required String age,
      required String gender,
      required String address,
      required String bloodType,
      required String maritalStatus,
      int? childrenNum,
      String? habits,
      required String profession,
      required int diabetes,
      required int bloodPressure,
      required int wallet,
      var image}) async {
    final response =
        await _apiServices.post("${AppUrl.updatePatientProfile}$id", body: {
      if (firstName != null) "first_name": firstName,
      if (middleName != null) "middle_name": middleName,
      if (lastName != null) "last_name": lastName,
      if (phoneNumber != null) "phone_number": phoneNumber,
      if (description != null) "description": description,
      "birth_date": birthDate,
      "age": age,
      "gender": gender,
      "address": address,
      "blood_type": bloodType,
      "marital_status": maritalStatus,
      if (childrenNum != null) "children_num": childrenNum,
      if (habits != null) "habits": habits,
      "proffesion": profession,
      "diabetes": diabetes,
      "blood_pressure": bloodPressure,
      "wallet": wallet,
      if (image != null) "image": image
    });
    return BaseModel(data: response['data'], message: response['message']);
  }

  ///////////////////////////* Sessions *///////////////////////////
  Future<BaseModel> addSession(int patientId) async {
    final response = await _apiServices.post(
        '${AppUrl.addSession}${patientId.toString()}',
        body: {},
        queryParams: {'id': patientId});
    return BaseModel(data: null, message: response['message']);
  }

  Future<BaseModel> closeSession(int sessionId) async {
    debugPrint(
      '${AppUrl.closeSession}${sessionId.toString()}',
    );
    debugPrint('0000000000000000000000000000000000000000000');
    final response = await _apiServices.post(
        '${AppUrl.closeSession}${sessionId.toString()}',
        body: {},
        queryParams: {'id': sessionId});
    return BaseModel(data: null, message: response['message']);
  }

  Future<BaseModels> getOpenSession(int patientId) async {
    final response = await _apiServices.get(
        '${AppUrl.getOpenSessionForAPatient}${patientId.toString()}',
        queryParams: {'id': patientId.toString()});
    debugPrint('here you are inside the session remote if 12121212$response');
    final List<dynamic> data = response["data"];
    final List<Session> sessions =
        data.map((json) => Session.fromJson(json)).toList();
    debugPrint(
        'here you are inside the session remote if 222222222222222222$sessions');
    debugPrint(
        'here you are inside the session remote if 222222222222222222$data');
    return BaseModels(list: sessions);
  }

  Future<BaseModel> uploadFile(
      Uint8List fileBytes, String fileName, int sessionId) async {
    final response =
        await _apiServices.post('${AppUrl.uploadFile}${sessionId.toString()}',
            formData: FormData.fromMap(
              {
                'file': MultipartFile.fromBytes(fileBytes, filename: fileName),
              },
            ),
            queryParams: {'id': sessionId});
    return BaseModel(data: null, message: response['message']);
  }
}
