import 'dart:convert';

import '../../../../../core/data/models/base_model.dart';
import '../../../../../core/domain/services/api_service.dart';
import '../../../../../core/domain/urls/app_url.dart';

class GetSectionsRemote{
  final ApiServices apiService;

  GetSectionsRemote(this.apiService);


  Future<BaseModel>getSection()async{
    final response= await apiService.get(AppUrl.getSections);

    return BaseModel(data: response['data'],message: response['message']);
  }






}