import 'package:dashboad/core/data/models/base_model.dart';
import 'package:dashboad/core/data/models/user_model.dart';
import 'package:dashboad/core/domain/services/api_service.dart';
import 'package:dashboad/core/domain/app_url.dart';

class DirectorRemoteDataSource {
  final ApiServices _apiServices;
  DirectorRemoteDataSource(this._apiServices);
  Future<BaseModels> getDirectors() async {
    final response = await _apiServices.get(AppUrl.getDirectorsList);

    return BaseModels.fromJson(response, (json) => UserModel.fromJson(json));
  }

  Future<void> deleteDirector(int id) async {
    await _apiServices.get(
      AppUrl.deleteDirector,
      id: id,
    );
  }
}
