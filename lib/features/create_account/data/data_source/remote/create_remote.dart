import '../../../../../core/data/models/base_model.dart';
import '../../../../../core/domain/services/api_service.dart';
import '../../../../../core/domain/urls/app_url.dart';
import '../../models/usermodel.dart';

class CreateRemoteDataSource{
  final ApiServices apiService;

  CreateRemoteDataSource(this.apiService);

  Future<Usermodel> create_director ({
    required String first_name,
    required String middle_name,
    required String last_name,
    required String phone_number,
    required String description,
})async{
    final response = await apiService.post(AppUrl.creatDirector,
        body: {
          "first_name": first_name,
          "middle_name": middle_name,
          "last_name": last_name,
          "phone_number": phone_number,
          "description": description
        });

    return Usermodel.fromJson(response);
  }


  Future<BaseModel> create_patient( {required String first_name,
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
    required String user_type})async{
    final response=await apiService.post(AppUrl.creatPatient,
        body: {
          "first_name":  first_name,
          "middle_name": middle_name ,
          "last_name":  last_name,
          "phone_number":  phone_number,
          "user_type":  user_type,
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
          "wallet": wallet
        });
    return BaseModel(data: response["data"],message: response["message"]);

  }

}