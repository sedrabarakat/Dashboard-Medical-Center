import 'package:dashboad/core/domain/services/api_service.dart';
import 'package:dashboad/core/domain/urls/app_url.dart';

import '../../../../core/data/models/base_model.dart';

class InboxRemote{

  ApiServices apiServices;

  InboxRemote(this.apiServices);

  Future<BaseModel>getInbox()async{
  final response= await apiServices.get(AppUrl.getInbox);
  return BaseModel(data: response["data"], message: response["message"]);
}


}