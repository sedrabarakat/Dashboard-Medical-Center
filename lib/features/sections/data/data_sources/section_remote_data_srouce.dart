  import 'dart:typed_data';

import 'package:dashboad/core/data/models/base_model.dart';
import 'package:dashboad/core/domain/services/api_service.dart';
import 'package:dashboad/core/domain/urls/app_url.dart';

import 'package:dashboad/features/sections/data/models/section_model.dart';
import 'package:dio/dio.dart';

class SectionRemoteDataSrouce {
  final ApiServices _apiServices;
  SectionRemoteDataSrouce(this._apiServices);

  Future<BaseModel<SectionModel>> createSection(
      String name, Uint8List image) async {
    final response = await _apiServices.post(
      AppUrl.createSection,
      formData: FormData.fromMap(
        {
          'name': name,
          'image': MultipartFile.fromBytes(image, filename: name),
        },
      ),
    );
    return BaseModel.fromJson(
      response,
      (json) => SectionModel.fromJson(json),
    );
  }

  Future<BaseModel<SectionModel>> updateSection(
      int id, String name, Uint8List image) async {
    final response = await _apiServices.post(
      "${AppUrl.updateSection}$id",
      //todo fix the image
      formData: FormData.fromMap({
        "name": name,
        "image": MultipartFile.fromBytes(image, filename: name + ".jpg"),
      }),
    );
    return BaseModel.fromJson(
      response,
      (json) => SectionModel.fromJson(json),
    );
  }

  Future<BaseModels> getSections() async {
    final response = await _apiServices.get(AppUrl.getSections);
    return BaseModels.fromJson(
      response['data'],
      (json) => SectionModel.fromJson(json),
    );
  }

  Future<BaseModel<SectionModel>> getSectionInformation(int id) async {
    final response =
        await _apiServices.get("${AppUrl.getSectionInformation}$id");
    return BaseModel.fromJson(
      response,
      (json) => SectionModel.fromJson(json),
    );
  }

  Future<BaseModel> deleteSection(int id) async {
    await _apiServices.delete("${AppUrl.deleteSection}$id");
    return BaseModel(data: null, message: "Section Deleted Successfully");
  }

  Future<BaseModel<SectionService>> createService(
      String name, String description, String price, String sectionId) async {
    final response = await _apiServices.post(
      AppUrl.createService,
      body: {
        'name': name,
        'description': description,
        'price': price,
        'section_id': sectionId,
      },
    );
    return BaseModel.fromJson(
        response, (json) => SectionService.fromJson(json));
  }

  Future<BaseModel<SectionService>> editService(int serviceId, String name,
      String price, String description, String sectionId) async {
    final response =
        await _apiServices.post("${AppUrl.editService}$serviceId", body: {
      'name': name,
      'description': description,
      'price': price,
      "section_id": sectionId,
    });
    return BaseModel.fromJson(
      response,
      (json) => SectionService.fromJson(json),
    );
  }

  Future<BaseModel> deleteService(int id) async {
    await _apiServices.delete("${AppUrl.deleteService}$id");
    return BaseModel(data: null, message: "Service Deleted Successfully");
  }
}
