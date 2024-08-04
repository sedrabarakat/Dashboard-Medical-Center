import 'package:dashboad/core/data/models/base_model.dart';
import 'package:dashboad/core/domain/services/api_service.dart';
import 'package:dashboad/core/domain/urls/app_url.dart';
import 'package:dashboad/features/doctors/data/model/doctor_model.dart';

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
}
