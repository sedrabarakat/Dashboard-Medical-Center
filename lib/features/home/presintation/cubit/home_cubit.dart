import 'package:bloc/bloc.dart';
import 'package:dashboad/features/home/presintation/cubit/home_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeStates>{

  HomeCubit():super(InitHome());

  static HomeCubit get(context)=>BlocProvider.of(context);



}