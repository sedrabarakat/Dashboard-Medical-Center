import 'package:dashboad/core/data/models/base_model.dart';
import 'package:dashboad/core/domain/services/api_service.dart';
import 'package:dashboad/core/domain/urls/app_url.dart';
import 'package:dashboad/features/patients/data/models/patient_model.dart';

class PatientRemoteDataSource {
  final ApiServices _apiServices;
  PatientRemoteDataSource(this._apiServices);
  Future<BaseModels> getPatients() async {
    final response = await _apiServices.get(AppUrl.getPatientsList);
    print(
        "************************************************************************************");

    return BaseModels.fromJson(
        response['data'], (itemJson) => PatientModel.fromJson(itemJson));
  }

  Future<void> deletePatient(int id) async {
    await _apiServices.get(
      AppUrl.deletePatient,
      id: id,
    );
  }
}
