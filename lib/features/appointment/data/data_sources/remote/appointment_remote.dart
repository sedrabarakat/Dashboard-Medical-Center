import 'package:dashboad/core/domain/services/api_service.dart';
import 'package:dashboad/core/domain/urls/app_url.dart';

import '../../../../../core/data/models/base_model.dart';
import '../../models/appointment_model.dart';

class AppointmentRemote {
  final ApiServices _apiServices;

  AppointmentRemote(this._apiServices);

  Future<BaseModels> getAppointment() async {
    final response = await _apiServices.get(AppUrl.getAppointment);
    return BaseModels.fromJson(
        response['data'], (itemJson) => AppointmentModel.fromJson(itemJson));
  }
  
  Future<void> deleteAppointment(int id)async{
    await _apiServices.delete("${AppUrl.deleteAppointment}$id",) ;
  }
}
