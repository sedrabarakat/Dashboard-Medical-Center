import 'package:dartz/dartz.dart';
import 'package:dashboad/core/data/models/base_model.dart';
import 'package:dashboad/core/domain/error_handler/network_exceptions.dart';
import 'package:dashboad/features/appointment/data/data_sources/remote/appointment_remote.dart';

class AppointmentRepo{
  final AppointmentRemote _appointmentRemote ;

  AppointmentRepo(this._appointmentRemote);

  Future<Either<NetworkExceptions, BaseModels>> getAppointment()async{
    try{
      final response = await _appointmentRemote.getAppointment() ;
      return right(response) ;
    }catch(error){
      return left(NetworkExceptions.getException(error)); 
    }
  }

  Future<Either<NetworkExceptions, Unit>> deleteAppointment(int id)async{
    try{
      final response = await _appointmentRemote.deleteAppointment(id ) ;
      return right(unit) ;
    }catch(e){
      return left(NetworkExceptions.getException(e)) ;
    }
  }
}