import 'package:dashboad/core/data/models/base_model.dart';
import 'package:dashboad/core/domain/services/api_service.dart';
import 'package:dashboad/core/domain/app_url.dart';

class AuthRemoteDataSource {
  final ApiServices _apiServices;
  AuthRemoteDataSource(this._apiServices);
  Future<BaseModel> requestCode(String phoneNumber, String password) async {
    final response = await _apiServices.post(
      AppUrl.requestCode,
      body: {
        'phone_number': phoneNumber,
        'password': password,
      },
    );
    return BaseModel(data: null, message: response['message']);
  }

  Future<BaseModel<String>> verifyCode(String phoneNumber, String code) async {
    final response = await _apiServices.post(
      AppUrl.verifyCode,
      body: {
        'phone_number': phoneNumber,
        'code': code,
      },
    );
    return BaseModel(data: response['token'], message: "Success");
  }
}
