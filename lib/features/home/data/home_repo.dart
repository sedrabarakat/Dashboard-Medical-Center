import 'package:dartz/dartz.dart';
import 'package:dashboad/features/home/data/home_remote.dart';
import '../../../core/data/models/base_model.dart';
import '../../../core/domain/error_handler/network_exceptions.dart';
import 'models/appointments_Model_s.dart';
import 'models/gender_model.dart';

class HomeRepo{

  HomeRemote homeRemote;

  HomeRepo(this.homeRemote);


  Future<Either<NetworkExceptions,List<GenderModel>>>getGender()async{
    try {
      BaseModel baseModel = await homeRemote.getGender();
      List<GenderModel>list = [];
      for (int i = 0; i < baseModel.data.length; i++) {
        list.add(GenderModel.fromJson(baseModel.data[i]));
      }
      return right(list);
    }
    catch(error){
      return left(NetworkExceptions.getException(error));
    }
  }

  Future<Either<NetworkExceptions,List<AppointmentsModelS>>>getAppointment()async{
    try {
      BaseModel baseModel = await homeRemote.getAppointment();
      List<AppointmentsModelS>list = [];
      for (int i = 0; i < baseModel.data.length; i++) {
        list.add(AppointmentsModelS.fromJson(baseModel.data[i]));
      }
      return right(list);
    }
    catch(error){
      return left(NetworkExceptions.getException(error));
    }
  }

  Future<Either<NetworkExceptions,Map<String,dynamic>>>getNumbers()async{
    try {
      Map<String,dynamic> map = await homeRemote.getNumbers();
      return right(map["count"]);
    }
    catch(error){
      return left(NetworkExceptions.getException(error));
    }
  }
}