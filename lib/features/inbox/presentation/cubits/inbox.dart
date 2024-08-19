import 'package:bloc/bloc.dart';
import 'package:dashboad/features/inbox/data/models/inbox_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repository/inbox_repo.dart';
import 'inbox_states.dart';

class inbox_cubit extends Cubit<inbox_states>{

  InboxRepo inboxRepo;

  inbox_cubit(this.inboxRepo):super(init_inbox_state());

  static inbox_cubit get(context)=>BlocProvider.of(context);


  List <InboxModel>complaints=[];

  Future<void> getInbox()async{
    emit(Loading_get_inbox());
    await inboxRepo.getInbox().then((value){
      value.fold((error){
        emit(Error_get_inbox(error));
      }, (list){
        complaints=list;
        emit(Success_get_inbox());
      });
    });

  }
}