
import 'package:dartz/dartz.dart';
import 'package:dashboad/core/data/models/base_model.dart';
import 'package:dashboad/core/domain/error_handler/network_exceptions.dart';
import 'package:dashboad/features/appointment/data/data_sources/remote/appointment_remote.dart';
import 'package:dashboad/features/appointment/data/models/appointment_model.dart';
import 'package:dashboad/features/appointment/data/models/working_hours_model.dart';

import '../../../sections/data/models/section_model.dart';

class AppointmentRepo {
  final AppointmentRemote _appointmentRemote;

  AppointmentRepo(this._appointmentRemote);

  Future<Either<NetworkExceptions, BaseModels>> getAppointment() async {
    try {
      final response = await _appointmentRemote.getAppointment();
      return right(response);
    } catch (error) {
      return left(NetworkExceptions.getException(error));
    }
  }

  Future<Either<NetworkExceptions, Unit>> deleteAppointment(int id) async {
    try {
      final response = await _appointmentRemote.deleteAppointment(id);
      return right(unit);
    } catch (e) {
      return left(NetworkExceptions.getException(e));
    }
  }

  Future<Either<NetworkExceptions, BaseModel<WorkingHoursModel>>> getDoctorSchedule(
      int doctorId) async {
    try {
      final response = await _appointmentRemote.getDoctorSchedule(doctorId);
      return right(response);
    } catch (e) {
      return left(NetworkExceptions.getException(e));
    }
  }

  Future<Either<NetworkExceptions, BaseModel<SectionModel>>>
  getSectionInformation(int id) async {
    try {
      final response = await _appointmentRemote.getSectionInformation(id);
      return right(response);
    } catch (error) {
      return left(NetworkExceptions.getException(error));
    }
  }

  Future<Either<NetworkExceptions, BaseModel<AppointmentModel>>> updateAppointment(int appointmentId,
      int doctorId, int patientId, String date, String time) async{
    try{
      final response = await _appointmentRemote.updateAppointment(appointmentId, doctorId, patientId, date, time) ;
      return right(response) ;
    }catch(e){
      return left(NetworkExceptions.getException(e)) ;
    }

  }
}
