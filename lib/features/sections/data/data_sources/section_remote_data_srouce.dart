import 'package:dashboad/core/data/models/base_model.dart';
import 'package:dashboad/core/domain/services/api_service.dart';
import 'package:dashboad/core/domain/urls/app_url.dart';
import 'package:dashboad/features/doctors/data/model/doctor_model.dart';

class SectionRemoteDataSrouce {
  final ApiServices _apiServices;
  SectionRemoteDataSrouce(this._apiServices);

  Future<BaseModel> createSection(String name) async {
    await _apiServices.post(
      AppUrl.createSection,
      body: {
        'name': name,
      },
    );
    return BaseModel(data: null, message: 'Section Created Successfully');
  }

  Future<BaseModel<SectionModel>> updateSection(int id, String name) async {
    final response = await _apiServices.post(
      "${AppUrl.updateSection}$id",
      body: {
        "name": name,
      },
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
    await _apiServices.get("${AppUrl.deleteSection}$id");
    return BaseModel(data: null, message: "Section Deleted Successfully");
  }
}
