import 'package:dashboad/core/data/models/base_model.dart';
import 'package:dashboad/core/data/models/user_model.dart';
import 'package:dashboad/core/domain/services/api_service.dart';
import 'package:dashboad/core/domain/urls/app_url.dart';

class LaboratoryRemoteDataSource {
  final ApiServices _apiServices;
  LaboratoryRemoteDataSource(this._apiServices);
  Future<BaseModels> getLabMasters() async {
    final response = await _apiServices.get(AppUrl.getLabMastersList);

    return BaseModels.fromJson(
        response['data'], (json) => UserModel.fromJson(json));
  }

  Future<void> deleteLabMaster(int id) async {
    await _apiServices.get(
      "${AppUrl.deleteLabMaster}$id",
    );
  }
}
