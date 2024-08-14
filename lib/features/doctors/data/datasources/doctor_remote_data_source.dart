import 'package:dashboad/core/data/models/base_model.dart';
import 'package:dashboad/core/domain/services/api_service.dart';
import 'package:dashboad/core/domain/urls/app_url.dart';
import 'package:dashboad/features/doctors/data/model/doctor_model.dart';
import 'package:dashboad/features/doctors/domain/constants/const.dart';

class DoctorRemoteDataSource {
  final ApiServices _apiServices;
  DoctorRemoteDataSource(this._apiServices);
  Future<BaseModels> getDoctors() async {
    final response = await _apiServices.get(AppUrl.getDoctorsList);

    return BaseModels.fromJson(
        response['data'], (json) => DoctorModel.fromJson(json));
  }

  Future<void> deleteDoctor(int id) async {
    await _apiServices.get(
      "${AppUrl.deleteDoctor}$id",
    );
  }

  Future<BaseModel> getProfile({required int id}) async {
    final response = await _apiServices.get("${AppUrl.getDoctorProfile}$id");

    return BaseModel(data: response['data'], message: response['message']);
  }

  Future<BaseModel> updateProfile(
      {required int id,
      String? firstName,
      String? middleName,
      String? lastName,
      String? phoneNumber,
      String? description,
      required String sectionId,
      required String sessionDuration,
      required String dayInAdvanced,
      var workingHour,
      var image}) async {
    final response =
        await _apiServices.post("${AppUrl.updateDoctor}$id", body: {
      if (firstName != null) "first_name": firstName,
      if (middleName != null) "middle_name": middleName,
      if (lastName != null) "last_name": lastName,
      if (phoneNumber != null) "phone_number": phoneNumber,
      if (description != null) "description": description,
      if (image != null) "image": image,
      "section_id": sectionId,
      "days_in_advance": dayInAdvanced,
      "session_durtion": sessionDuration,
      //"working_hours ":Working_hour
    });

    return BaseModel(data: response['data'], message: response['message']);
  }

  Future<BaseModel> addDoctorSchedule({required int id}) async {
    final response = await _apiServices.post(
        "${AppUrl.postDoctorSchedule}$id/schedule",
        body: {"working_hours": Work_Days});
    return BaseModel(data: response['data'], message: response['message']);
  }

  Future<BaseModel> getDoctorShedule({required int id}) async {
    final response =
        await _apiServices.get("${AppUrl.getDoctorSchedule}$id/schedule");
    return BaseModel(data: response['data'], message: response['message']);
  }
}
