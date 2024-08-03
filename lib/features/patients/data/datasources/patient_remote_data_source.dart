import 'package:dashboad/core/data/models/base_model.dart';
import 'package:dashboad/core/domain/services/api_service.dart';
import 'package:dashboad/core/domain/urls/app_url.dart';
import 'package:dashboad/features/patients/data/models/patient_model.dart';

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
      AppUrl.deletePatient + "$id",
    );
  }

  Future<BaseModel>getPatientProfile({
    required int id
})async{
    final response= await _apiServices.get("${AppUrl.getPatientProfile}$id");

   return BaseModel(data: response['data'],message: response['message']);
  }

  Future<BaseModel>updatePatientProfile({
    required int id,
    required String first_name,
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
    var image
})async{
    final response= await _apiServices.post("${AppUrl.updatePatientProfile}$id",
        body: {
          "first_name":  first_name,
          "middle_name": middle_name ,
          "last_name":  last_name,
          "phone_number":  phone_number,
          "description":  description,
          "birth_date": birth_date,
          "age":  age,
          "gender": gender,
          "address":  address,
          "blood_type":  bloodType,
          "marital_status": marital_status,
          "children_num": children_num,
          "habits":  habits,
          "proffesion":  profession,
          "diabetes": diabetes,
          "blood_pressure": blood_pressure,
          "wallet": wallet,
          if(image!=null) "image":image
        }
    );
    return BaseModel(data: response['data'],message: response['message']);
  }
}
