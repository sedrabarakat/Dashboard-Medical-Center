import 'package:bloc/bloc.dart';
import 'package:dashboad/features/appointment/data/models/available_time_model.dart';
import 'package:dashboad/features/appointment/data/models/working_hours_model.dart';
import 'package:dashboad/features/appointment/domain/repositories/appointment_repo.dart';
import 'package:dashboad/features/appointment/presentation/cubit/appointment_state.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:progress_state_button/progress_button.dart';

import '../../../../core/data/datasources/local.dart';
import '../../../../core/helpers/json_helper.dart';
import '../../../../core/widgets/toast_bar.dart';
import '../../../doctors/data/model/doctor_model.dart';
import '../../../patients/data/models/patient_model.dart';
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
    selectedTime = appointment.startTime;
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
      getAppointment() ;
      emit(GetAppointmentSuccessState(_appointments)) ;
    }) ;
  }


  ///////////////////////////////..Add appointment..///////////////////////////////
  ButtonState bookButtonState = ButtonState.idle;
  List<PatientModel> _patients = [];
  List<DoctorModel> _doctors = [];
  int addAppointmentDoctorId = 1;
  late int addAppointmentPatientId ;
  late DateTime addAppointmentSelectedDate ;
  late String addAppointmentDayOfWeek ;
  late AvailableTimeModel availableTimeModel ;
  late String formattedDate ;

  int? selectedPatientId;

  void setSelectedPatientId(int patientId) {
    selectedPatientId = patientId;
    emit(AppointmentPatientUpdatedState());
  }
  void setSelectedDoctorId(int doctorId) {
    selectedPatientId = doctorId;
    emit(AppointmentDoctorUpdatedState());
  }
  String _getDayOfWeek(DateTime date) {
    return [
      'Sunday',
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday'
    ][date.weekday % 7];
  }
  Future<void> getPatients() async {
    List<String> patientCachedList =
    await SharedPrefrence.getListOfString('patients');
    // Check if there is cached data if true then return the cached data
    if (patientCachedList.isNotEmpty) {
      _patients = JsonHelper.convertListOfStringToListOfObjects<PatientModel>(
        patientCachedList,
        PatientModel.fromJson,
      );
      emit(GetPatientSuccessState(_patients));
      return;
    }
    emit(GetPatientsLoadingState());

    final response = await _repo.getPatients();
    response.fold((error) {
      emit(GetPatientsErrorState(error));
    }, (data) {
      List<PatientModel> listOfPatients =
      data.list.map((patient) => patient as PatientModel).toList();
      _patients = listOfPatients;
      SharedPrefrence.saveListOfObject(_patients, 'patients');
      emit(GetPatientSuccessState(_patients));
    });
  }

  Future<void> getDoctors() async {
    List<String> cachedDoctors =
    await SharedPrefrence.getListOfString('doctors');
    if (cachedDoctors.isNotEmpty) {
      _doctors = JsonHelper.convertListOfStringToListOfObjects<DoctorModel>(
        cachedDoctors,
        DoctorModel.fromJson,
      );
      addAppointmentDoctorId = _doctors[0].id ;
      emit(GetDoctorsSuccessState(_doctors));
      return;
    }
    emit(GetDoctorsLoadingState());
    final response = await _repo.getDoctors();
    response.fold((error) {
      emit(GetDoctorsErrorState(error));
    }, (data) async {
      List<DoctorModel> listOfDoctors =
      data.list.map((doctors) => doctors as DoctorModel).toList();
      _doctors = listOfDoctors;
      SharedPrefrence.saveListOfObject(_doctors, 'doctors');
      emit(GetDoctorsSuccessState(_doctors));
    });
  }

  void onDateSelected(DateTime selectedDate) {
    print('Selected Date: $selectedDate');
    addAppointmentSelectedDate = selectedDate ;
    addAppointmentDayOfWeek = _getDayOfWeek(addAppointmentSelectedDate);
    formattedDate = DateFormat('yyyy-MM-dd').format(selectedDate);
    debugPrint(formattedDate) ;
  }

  Future<void> getAvailableTime(int doctorId)async{
    emit(GetAvailableLoadingState()) ;
    final response = await _repo.getAvailableTime(doctorId, formattedDate, addAppointmentDayOfWeek) ;
    response.fold((error){
      emit(GetAvailableErrorState(error)) ;
    }, (data){
      //emit(GetAvailableSuccessState(availableTimeModel)) ;
      debugPrint('12121212120') ;
      debugPrint(data.data.toString()) ;
      availableTimeModel = data.data;
      debugPrint(availableTimeModel.toString()) ;
      debugPrint(availableTimeModel.toString()) ;
      emit(GetAvailableSuccessState(availableTimeModel)) ;
    }) ;
  }

  void setAppointmentPatientId(int patientId) {
    addAppointmentPatientId = patientId;
    emit(AppointmentPatientUpdatedState());
  }
void setAppointmentDoctorId(int doctorId) {
    addAppointmentDoctorId = doctorId;
    emit(AppointmentDoctorIdUpdatedState(addAppointmentDoctorId));
  }

  Future<void> addNewAppointment()async{
    bookButtonState = ButtonState.loading ;
    debugPrint("$addAppointmentPatientId$addAppointmentPatientId$addAppointmentDayOfWeek$formattedDate");
    emit(AddNewAppointmentLoadingState()) ;
    final response = await _repo.addNewAppointment(addAppointmentDoctorId, addAppointmentPatientId,formattedDate, addAppointmentDayOfWeek) ;
    debugPrint(response.toString()) ;
    response.fold((error){
      bookButtonState = ButtonState.fail ;
      emit(AddNewAppointmentErrorState(error));
    }, (data){
      bookButtonState = ButtonState.success ;
      emit(AddNewAppointmentSuccessState(data.data)) ;
    }) ;
  }





}
