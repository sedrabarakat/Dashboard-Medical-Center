import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/drawer_items.dart';
import 'basic_states.dart';

class BasicCubit extends Cubit<BasicStates>{

  BasicCubit():super(Init_BasicStates());

  static BasicCubit get(context)=>BlocProvider.of(context);

  int Selected_Index=1;//in_drawer


void Change_Selected_Tap({
  required int index
}){
  Selected_Index=index;
  emit(Change_Selected_Tap_State());
}



}