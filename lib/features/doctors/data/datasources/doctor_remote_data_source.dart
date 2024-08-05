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
      AppUrl.deleteDoctor + "$id",
    );
  }

  Future<BaseModel>getProfile({
    required int id
})async{
    final response=await _apiServices.get("${AppUrl.getDoctorProfile}$id");

    return BaseModel(data: response['data'],message: response['message']);
  }

  Future<BaseModel>updateProfile({
    required int id,
    String ?first_name,
    String ?middle_name,
    String ?last_name,
    String ?phone_number,
    String ?description,
    required String Section_id,
    required String Session_duration,
    required String Day_In_Advanced,
    var Working_hour,
    var image

  })async{
    final response=await _apiServices.post("${AppUrl.updateDoctor}$id",
    body: {
      if(first_name!=null)"first_name":  first_name,
      if(middle_name!=null) "middle_name": middle_name ,
      if(last_name!=null)"last_name":  last_name,
      if(phone_number!=null)"phone_number":  phone_number,
      if(description!=null)"description":  description,
      if(image!=null) "image": image,
      "section_id":Section_id,
      "days_in_advance":Day_In_Advanced,
      "session_durtion":Session_duration,
      //"working_hours ":Working_hour
    });

    return BaseModel(data: response['data'],message: response['message']);
  }

  Future<BaseModel>addDoctorSchedule({
    required int id
})async{
    final response = await _apiServices.post("${AppUrl.postDoctorSchedule}$id/schedule",
    body:{
      "working_hours":Work_Days
    }
    );
    return BaseModel(data: response['data'],message: response['message']);
  }

  Future <BaseModel>getDoctorShedule({
    required int id
})async{
    final response= await _apiServices.get("${AppUrl.getDoctorSchedule}$id/schedule");
    return BaseModel(data: response['data'],message: response['message']);
  }
}
