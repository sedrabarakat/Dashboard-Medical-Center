import 'dart:convert';
import 'dart:io';

import '../../../../../core/data/models/base_model.dart';
import '../../../../../core/domain/services/api_service.dart';
import '../../../../../core/domain/urls/app_url.dart';

class CreateRemoteDataSource {
  final ApiServices apiService;

  CreateRemoteDataSource(this.apiService);

  Future<BaseModel> create_user(
      {required String first_name,
      required String middle_name,
      required String last_name,
      required String phone_number,
      required String description,
      required String user_type,
      required String password,
      var image}) async {
    final response =
        await apiService.post(AppUrls_Toggle(user_type: user_type), body: {
      "first_name": first_name,
      "middle_name": middle_name,
      "last_name": last_name,
      "phone_number": phone_number,
      "description": description,
      "password": password,
      if (image != null) "image": image
    });
    return BaseModel(data: response['data'], message: response['message']);
  }

  String AppUrls_Toggle({required String user_type}) {
    if (user_type == "Director") {
      return AppUrl.creatDirector;
    } else if (user_type == "Receptionist") {
      return AppUrl.creatReceptionist;
    } else {
      return AppUrl.creatLabMaster;
    }
  }

  Future<BaseModel> create_patient(
      {required String first_name,
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
      required String user_type,
      var image}) async {
    final response = await apiService.post(AppUrl.creatPatient, body: {
      "first_name": first_name,
      "middle_name": middle_name,
      "last_name": last_name,
      "phone_number": phone_number,
      "user_type": user_type,
      "description": description,
      "birth_date": birth_date,
      "age": age,
      "gender": gender,
      "address": address,
      "blood_type": bloodType,
      "marital_status": marital_status,
      "children_num": children_num,
      "habits": habits,
      "proffesion": profession,
      "diabetes": diabetes,
      "blood_pressure": blood_pressure,
      "wallet": wallet,
      if (image != null) "image": base64Decode(image)
    });
    return BaseModel(data: response["data"], message: response["message"]);
  }

  Future<BaseModel> createDoctor({
    required String first_name,
    required String middle_name,
    required String last_name,
    required String phone_number,
    required String description,
    required String password,
    var image,
    required String section_id,
    required String days_in_advance,
    required String session_durtion,
  }) async {
    final Response = await apiService.post(AppUrl.creatDoctor, body: {
      "first_name": first_name,
      "middle_name": middle_name,
      "last_name": last_name,
      "phone_number": phone_number,
      "description": description,
      "password": password,
      if (image != null) "image": image,
      "section_id": section_id,
      "days_in_advance": days_in_advance,
      "session_durtion": session_durtion
    });
    return BaseModel(data: Response["data"], message: Response["message"]);
  }
}
