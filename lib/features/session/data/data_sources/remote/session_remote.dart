import 'dart:typed_data';
import 'package:dashboad/core/data/models/base_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../../../../../core/domain/services/api_service.dart';
import '../../../../../core/domain/urls/app_url.dart';
import '../../model/session_model.dart';
class SessionRemoteDataSources {
  final ApiServices _apiServices;

  SessionRemoteDataSources({required ApiServices apiServices})
      : _apiServices = apiServices;

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
    debugPrint('here you are inside the session remote if 12121212$response') ;
      final List<dynamic> data = response["data"];
      final List<Session> sessions =
          data.map((json) => Session.fromJson(json)).toList();
      debugPrint('here you are inside the session remote if 222222222222222222$sessions') ;
      debugPrint('here you are inside the session remote if 222222222222222222$data') ;
      return BaseModels(list: sessions);

  }

  Future<BaseModel> uploadFile(Uint8List fileBytes,String fileName, int sessionId)async{
    final response = await _apiServices.post(
        '${AppUrl.uploadFile}${sessionId.toString()}',
      formData: FormData.fromMap(
        {
          'file': MultipartFile.fromBytes(fileBytes, filename: fileName),
        },
      ),
      queryParams: {
        'id' : sessionId
    }
    );
    return BaseModel(data: null, message: response['message']) ;
  }

}
