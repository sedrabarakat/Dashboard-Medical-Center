import 'package:dashboad/core/domain/services/api_service.dart';
import 'package:dashboad/core/domain/urls/app_url.dart';

import '../../../core/data/models/base_model.dart';


class HomeRemote{
  ApiServices apiServices;
  HomeRemote(this.apiServices);
  
  Future<Map<String,dynamic>>getNumbers()async{
    final response =await apiServices.get(AppUrl.getNum);

    return response;
  }
  Future<BaseModel>getGender()async{
    final response =await apiServices.get(AppUrl.getGender);

    return BaseModel(data: response['data'], message: response['message']);
  }
  Future<BaseModel>getAppointment()async{
    final response =await apiServices.get(AppUrl.getAppointmentss);

    return BaseModel(data: response['data'], message: response['message']);
  }
}