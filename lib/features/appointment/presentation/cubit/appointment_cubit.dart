import 'package:bloc/bloc.dart';
import 'package:dashboad/features/appointment/data/models/working_hours_model.dart';
import 'package:dashboad/features/appointment/domain/repositories/appointment_repo.dart';
import 'package:dashboad/features/appointment/presentation/cubit/appointment_state.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/toast_bar.dart';
import '../../../doctors/data/model/doctor_model.dart';
import '../../../sections/data/models/section_model.dart';
import '../../data/models/appointment_model.dart';

class AppointmentCubit extends Cubit<AppointmentState> {
  final AppointmentRepo _repo;
  late DateTime selectedDate;
  String? selectedTime;
  bool isEditing = false;
  WorkingHoursModel? workingHours;

  AppointmentCubit(this._repo) : super(AppointmentInitialState());
  List<AppointmentModel> _appointments = [];
  List<DoctorModel> doctors = [];
  SectionModel? sectionDetails;

  void init(AppointmentModel appointment){
    selectedDate = DateTime.parse(appointment.date);
    selectedTime = appointment.startMin;
    //getScheduleForDoctor(appointment.doctorId);
  }


  Future<void> getAppointment() async {
    emit(GetAppointmentLoadingState());
    final response = await _repo.getAppointment();
    response.fold((error) {
      emit(GetAppointmentErrorState(error));
    }, (data) {
      List<AppointmentModel> listAllAppointments = data.list
          .map((appointment) => appointment as AppointmentModel)
          .toList();
      _appointments = listAllAppointments;
      debugPrint(_appointments.toString());
      emit(GetAppointmentSuccessState(_appointments));
    });
  }

  Future<void> deleteAppointment(BuildContext context, int id)async{
    AppointmentModel deletedAppointment = _appointments.firstWhere((appointment) => appointment.id == id) ;
    _appointments.removeWhere((appointment) => appointment.id == id) ;
    emit(GetAppointmentSuccessState(_appointments));
    final response = await _repo.deleteAppointment(id) ;
    response.fold((error){
      ToastBar.onNetworkFailure(context,
          networkException: error, title: "Error");
      _appointments.add(deletedAppointment) ;
      emit(DeleteAppointmentErrorState(error));
      emit(GetAppointmentSuccessState(_appointments));
    }, (unit){
      getAppointment();
    });
  }

  Future<void> getScheduleForDoctor(int doctorId)async{
    emit(GetScheduleForDoctorLoadingState()) ;
    final response = await _repo.getDoctorSchedule(doctorId) ;
    response.fold((error)=>emit(GetScheduleForDoctorErrorState(error)), (data){
      workingHours = data.data ;
      emit(GetScheduleForDoctorSuccessState(data.data!)) ;
    }) ;
  }
  Future<void> getSectionInformation(int id) async {
    emit(GetSectionInformationLoadingState());
    final response = await _repo.getSectionInformation(id);
    response.fold((e) => emit(GetSectionInformationErrorState(e)), (data) {
      sectionDetails = data.data;
      data.data!.doctor ==null? []:doctors =data.data!.doctor! ;
      emit(
        GetSectionInformationSuccessState(data.data!),
      );
    });
  }

  Future<void> updateAppointment(int appointmentId, int patientId,int doctorId, String date, String time)async{
    emit(UpdateAppointmentLoadingState()) ;
    final response =  await _repo.updateAppointment(appointmentId, doctorId, patientId, date, time) ;
    response.fold((e){
      emit(UpdateAppointmentErrorState(e)) ;
    }, (data){
      emit(UpdateAppointmentSuccessState(data.data!));
      int index = _appointments.indexWhere((appointment) => appointment.id == data.data!.id) ;
      _appointments.removeAt(index) ;
      _appointments.insert(index, data.data!) ;
      emit(GetAppointmentSuccessState(_appointments)) ;
    }) ;
  }





}
