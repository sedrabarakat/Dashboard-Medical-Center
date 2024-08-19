import 'package:bloc/bloc.dart';
import 'package:dashboad/features/home/data/models/appointments_Model_s.dart';
import 'package:dashboad/features/home/data/models/gender_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/home_repo.dart';
import 'home_states.dart';

class HomeCubit extends Cubit<HomeStates>{
  HomeRepo homeRepo;

  HomeCubit(this.homeRepo):super(InitHome());

  static HomeCubit get(context)=>BlocProvider.of(context);

  List<GenderModel>genderList=[];
  List<AppointmentsModelS>appointmentList=[];

Future<void> getGender()async{
  emit(LoadingGetGender());
  await homeRepo.getGender().then((value){
    value.fold((error){
      emit(ErrorGetGender());
    }, (list){
      genderList=list;
      emit(SuccessGetGender());
    });
  });
}

  Future<void> getAppointment()async{
    emit(LoadingGetAppointment());
    await homeRepo.getAppointment().then((value){
      value.fold((errror){
        emit(ErrorGetAppointment());
      }, (list){
        appointmentList=list;
        emit(SuccessGetAppointment());
      });
    });
  }

  Map<String,dynamic>count={};
  Future<void> getNums()async{
    emit(LoadingGetNums());
    await homeRepo.getNumbers().then((value){
      value.fold((errror){
        emit(ErrorGetNums());
      }, (map){
        count=map;
        emit(SuccessGetNums());
      });
    });
  }


}