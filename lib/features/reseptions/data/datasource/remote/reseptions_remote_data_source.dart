import 'package:dashboad/core/data/models/base_model.dart';
import 'package:dashboad/core/data/models/user_model.dart';
import 'package:dashboad/core/domain/services/api_service.dart';
import 'package:dashboad/core/domain/urls/app_url.dart';

class ReseptionsRemoteDataSource {
  final ApiServices _apiServices;
  ReseptionsRemoteDataSource(this._apiServices);
  Future<BaseModels> getReseptions() async {
    final response = await _apiServices.get(AppUrl.getReceptionsList);

    return BaseModels.fromJson(
        response['data'], (json) => UserModel.fromJson(json));
  }

  Future<void> deleteReceptionist(int id) async {
    await _apiServices.delete(
      "${AppUrl.deleteReceptionist}$id",
    );
  }
}
