import 'dart:typed_data';

import 'package:dashboad/core/data/models/base_model.dart';
import 'package:dashboad/core/domain/services/api_service.dart';
import 'package:dashboad/core/domain/urls/app_url.dart';
import 'package:dashboad/features/lab_master/data/models/request_model.dart';
import 'package:dashboad/features/sections/data/models/section_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class LabRemoteDataSource {
  final ApiServices _apiServices;
  LabRemoteDataSource(this._apiServices);
  Future<BaseModels> getLabRequet(String? search, String? status) async {
    final response = await _apiServices.get(AppUrl.getLabRequest, queryParams: {
      'search': search!,
      'status': status!,
    });

    return BaseModels.fromJson(
      response['data'],
      (itemJson) => RequestModel.fromJson(itemJson),
    );
  }

  Future<BaseModel> makeItDone(int id) async {
    await _apiServices.post("${AppUrl.makeItDone}$id ");
    return BaseModel(data: null, message: "The request completed");
  }

  Future<BaseModel> makeItFail(int id) async {
    await _apiServices.post("${AppUrl.makeItFail}$id ");
    return BaseModel(data: null, message: "The request failed");
  }

  Future<BaseModels> getServices() async {
    final response = await _apiServices.get(AppUrl.getServices);
    return BaseModels.fromJson(
        response['data'], (itemJson) => SectionService.fromJson(itemJson));
  }

  Future<BaseModel> uploadFile(int sessionDetailsId, Uint8List file,
      String fileType, String fileName, BuildContext context) async {
    await _apiServices.postFiles(
      "${AppUrl.uploadLabFile}$sessionDetailsId/upload-file",
      context,
      formData: FormData.fromMap(
        {
          'file': MultipartFile.fromBytes(file, filename: fileName),
          'file_type': fileType,
        },
      ),
    );
    return BaseModel(data: null, message: "File uploaded successfully");
  }
}
