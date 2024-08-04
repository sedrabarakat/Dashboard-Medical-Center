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
    await _apiServices.get(
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
     String ?first_name,
     String ?middle_name,
     String ?last_name,
     String ?phone_number,
     String ?description,
    required String birth_date,
    required String age,
    required String gender,
    required String address,
    required String bloodType,
    required String marital_status,
    int ?children_num,
    String ?habits,
    required String profession,
    required int diabetes,
    required int blood_pressure,
    required int wallet,
    var image
})async{
    final response= await _apiServices.post("${AppUrl.updatePatientProfile}$id",
        body: {
          if(first_name!=null)"first_name":  first_name,
          if(middle_name!=null) "middle_name": middle_name ,
          if(last_name!=null)"last_name":  last_name,
          if(phone_number!=null)"phone_number":  phone_number,
          if(description!=null)"description":  description,
          "birth_date": birth_date,
          "age":  age,
          "gender": gender,
          "address":  address,
          "blood_type":  bloodType,
          "marital_status": marital_status,
          if(children_num!=null)"children_num": children_num,
          if(habits!=null)"habits":  habits,
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
