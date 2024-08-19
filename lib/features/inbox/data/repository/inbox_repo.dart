import 'package:dartz/dartz.dart';
import 'package:dashboad/core/data/models/base_model.dart';
import 'package:dashboad/core/domain/error_handler/network_exceptions.dart';
import 'package:dashboad/features/inbox/data/models/inbox_model.dart';

import '../data_source/inbox_remote.dart';

class InboxRepo{
  InboxRemote inboxRemote;

  InboxRepo(this.inboxRemote);


  Future<Either<NetworkExceptions,List<InboxModel>>>getInbox()async{
    try {
      BaseModel baseModel = await inboxRemote.getInbox();
      List<InboxModel>list = [];
      for (int i = 0; i < baseModel.data.length; i++) {
        list.add(InboxModel.fromJson(baseModel.data[i]));
      }
      return right(list);
    }
    catch(error){
      return left(NetworkExceptions.getException(error));
    }





  }
}