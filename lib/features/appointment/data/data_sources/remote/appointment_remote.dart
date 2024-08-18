import 'package:dashboad/core/domain/services/api_service.dart';
import 'package:dashboad/core/domain/urls/app_url.dart';
import 'package:dashboad/features/appointment/data/models/available_time_model.dart';
import 'package:dashboad/features/appointment/data/models/working_hours_model.dart';
import 'package:flutter/cupertino.dart';

import '../../../../../core/data/models/base_model.dart';
import '../../../../doctors/data/model/doctor_model.dart';
import '../../../../patients/data/models/patient_model.dart';
import '../../../../sections/data/models/section_model.dart';
import '../../models/appointment_model.dart';

class AppointmentRemote {
  final ApiServices _apiServices;

  AppointmentRemote(this._apiServices);

  Future<BaseModels> getAppointment() async {
    final response = await _apiServices.get(AppUrl.getAppointment);
    return BaseModels.fromJson(
        response['data'], (itemJson) => AppointmentModel.fromJson(itemJson));
  }

  Future<void> deleteAppointment(int id) async {
    await _apiServices.delete(
      "${AppUrl.deleteAppointment}$id",
    );
  }

  Future<BaseModel<WorkingHoursModel>> getDoctorSchedule(int doctorId) async {
    final response =
        await _apiServices.get("${AppUrl.getDoctorScheduleTime}$doctorId");

    return BaseModel.fromJson(
        response, (json) => WorkingHoursModel.fromJson(json));
  }

  Future<BaseModel<SectionModel>> getSectionInformation(int sectionId) async {
    final response =
        await _apiServices.get("${AppUrl.getSectionInformation}$sectionId");
    return BaseModel.fromJson(
      response,
      (json) => SectionModel.fromJson(json),
    );
  }

  Future<BaseModel<AppointmentModel>> updateAppointment(int appointmentId,
      int doctorId, int patientId, String date, String time) async {
    final response = await _apiServices
        .post("${AppUrl.updateAppointment}$appointmentId", queryParams: {
      'id': appointmentId.toString()
    }, body: {
      "doctor_id": doctorId.toString(),
      "patient_id": patientId.toString(),
      "date": date,
      "start_min": time
    });
    return BaseModel.fromJson(
        response, (json) => AppointmentModel.fromJson(json));
  }

/////////////////////..add appointment ..////////////////
  Future<BaseModels> getPatients() async {
    final response = await _apiServices.get(AppUrl.getPatientsList);

    return BaseModels.fromJson(
        response['data'], (itemJson) => PatientModel.fromJson(itemJson));
  }

  Future<BaseModels> getDoctors() async {
    final response = await _apiServices.get(AppUrl.getDoctorsList);

    return BaseModels.fromJson(
        response['data'], (json) => DoctorModel.fromJson(json));
  }

  Future<BaseModel<AvailableTimeModel>> getAvailableTime(
      int doctorId, String dateTime, String dayOfWeek) async {
    final response = await _apiServices.get(
        "${AppUrl.getAvailableTime}$doctorId",
        queryParams: {'date': dateTime.toString(), 'dayOfWeek': dayOfWeek});
    return BaseModel.fromJson(
        response, (json) => AvailableTimeModel.fromJson(json));
  }

  Future<BaseModel<AppointmentModel>> addAppointment(
      int doctorId, int patientId, String date, String time) async {
    final response = await _apiServices.post(
      AppUrl.addNewAppointment,
      body: {
        'doctor_id':doctorId,
        'patient_id':patientId,
        'date':date,
        'start_min':time
      },
    );
    debugPrint(response.toString()) ;
    return BaseModel.fromJson(response, (json)=>AppointmentModel.fromJson(json)) ;
  }
}
