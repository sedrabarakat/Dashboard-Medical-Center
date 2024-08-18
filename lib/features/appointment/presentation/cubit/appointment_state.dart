import 'package:dashboad/core/domain/error_handler/network_exceptions.dart';
import 'package:dashboad/features/appointment/data/models/available_time_model.dart';
import 'package:dashboad/features/appointment/data/models/working_hours_model.dart';
import 'package:equatable/equatable.dart';

import '../../../doctors/data/model/doctor_model.dart';
import '../../../patients/data/models/patient_model.dart';
import '../../../sections/data/models/section_model.dart';
import '../../data/models/appointment_model.dart';

class AppointmentState extends Equatable{
  const AppointmentState();

  @override
  List<Object> get props => [];
}

class ToggleEditingState extends AppointmentState{
  final bool isEditing ;

  const ToggleEditingState(this.isEditing);

}
class DateSelectedState extends AppointmentState{
  final DateTime dateTime ;

  const DateSelectedState(this.dateTime);

}
class TimeSelectedState extends AppointmentState{
  final String? selectedTime ;

  const TimeSelectedState(this.selectedTime);

}
class ShowDatePickerErrorState extends AppointmentState{}

class AppointmentInitialState extends AppointmentState{}
class GetAppointmentLoadingState extends AppointmentState{}
class GetAppointmentSuccessState extends AppointmentState{
  final List<AppointmentModel> appointments ;

  const GetAppointmentSuccessState(this.appointments);
  @override
  List<Object> get props =>[appointments] ;

}
class GetAppointmentErrorState extends AppointmentState{
  final NetworkExceptions message ;

  const GetAppointmentErrorState(this.message);
  @override
  List<Object> get props =>[message] ;

}

class DeleteAppointmentSuccessState extends AppointmentState{
  final List<AppointmentModel> appointments  ;
  const DeleteAppointmentSuccessState(this.appointments) ;

  @override
  List<Object> get props =>[appointments] ;
}
class DeleteAppointmentErrorState extends AppointmentState{
  final NetworkExceptions error ;
  const DeleteAppointmentErrorState(this.error) ;

  @override
  List<Object> get props =>[error] ;
}

class GetScheduleForDoctorLoadingState extends AppointmentState{}
class GetScheduleForDoctorErrorState extends AppointmentState{
  final NetworkExceptions error ;
  const GetScheduleForDoctorErrorState(this.error) ;

  @override
  List<Object> get props =>[error] ;
}
class GetScheduleForDoctorSuccessState extends AppointmentState{
  final WorkingHoursModel workingHoursModel  ;
  const GetScheduleForDoctorSuccessState(this.workingHoursModel) ;

  @override
  List<Object> get props =>[workingHoursModel] ;
}


class GetSectionInformationLoadingState extends AppointmentState {}
class GetSectionInformationErrorState extends AppointmentState {
  final NetworkExceptions error;
  const GetSectionInformationErrorState(this.error);

  @override
  List<Object> get props =>[error] ;
}
class GetSectionInformationSuccessState extends AppointmentState {
  final SectionModel section;
  const GetSectionInformationSuccessState(this.section);

  @override
  List<Object> get props =>[section] ;
}

class UpdateAppointmentLoadingState extends AppointmentState{}
class UpdateAppointmentSuccessState extends AppointmentState{
  final AppointmentModel appointmentModel ;
 const  UpdateAppointmentSuccessState(this.appointmentModel) ;

  @override
  List<Object> get props =>[appointmentModel] ;
}
class UpdateAppointmentErrorState extends AppointmentState{
  final NetworkExceptions error;
  const UpdateAppointmentErrorState(this.error);

  @override
  List<Object> get props =>[error] ;
}


///////////////////.add appointment.////////////////
class GetPatientsLoadingState extends AppointmentState {}

class GetPatientSuccessState extends AppointmentState {
  List<PatientModel> patients;
  GetPatientSuccessState(this.patients);
}

class GetPatientsErrorState extends AppointmentState {
  NetworkExceptions error;
  GetPatientsErrorState(this.error);
}

class GetDoctorsLoadingState extends AppointmentState {}

class GetDoctorsSuccessState extends AppointmentState {
  List<DoctorModel> doctors;
  GetDoctorsSuccessState(this.doctors);
}

class GetDoctorsErrorState extends AppointmentState {
  NetworkExceptions error;
  GetDoctorsErrorState(this.error);
}
class GetAvailableLoadingState extends AppointmentState {}

class GetAvailableSuccessState extends AppointmentState {
  AvailableTimeModel availableTimeModel;
  GetAvailableSuccessState(this.availableTimeModel);
}

class GetAvailableErrorState extends AppointmentState {
  NetworkExceptions error;
  GetAvailableErrorState(this.error);
}

class AddNewAppointmentLoadingState extends AppointmentState{}
class AddNewAppointmentErrorState extends AppointmentState{
  final NetworkExceptions error ;
  const AddNewAppointmentErrorState(this.error) ;

  @override
  List<Object> get props =>[error] ;
}
class AddNewAppointmentSuccessState extends AppointmentState{
  final AppointmentModel appointmentModel  ;
  const AddNewAppointmentSuccessState(this.appointmentModel) ;

  @override
  List<Object> get props =>[appointmentModel] ;
}
class AppointmentPatientIdUpdatedState extends AppointmentState{
  final int patientId  ;
  const AppointmentPatientIdUpdatedState(this.patientId) ;

  @override
  List<Object> get props =>[patientId] ;
}
class AppointmentDoctorIdUpdatedState extends AppointmentState{
  final int doctorId  ;
  const AppointmentDoctorIdUpdatedState(this.doctorId) ;

  @override
  List<Object> get props =>[doctorId] ;
}
class AppointmentPatientUpdatedState extends AppointmentState{}
class AppointmentDoctorUpdatedState extends AppointmentState{}



