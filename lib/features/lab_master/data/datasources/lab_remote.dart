import 'package:dashboad/core/data/models/base_model.dart';
import 'package:dashboad/core/domain/services/api_service.dart';
import 'package:dashboad/core/domain/urls/app_url.dart';
import 'package:dashboad/features/lab_master/data/models/request_model.dart';
import 'package:dashboad/features/sections/data/models/section_model.dart';

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

  Future<void> uploadFile(int sessionDetailsId) async {
    final response = await _apiServices
        .postFiles("${AppUrl.uploadLabFile}$sessionDetailsId/upload-file");
  }
}
