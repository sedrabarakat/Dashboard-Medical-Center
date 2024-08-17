import 'package:dashboad/core/domain/error_handler/network_exceptions.dart';
import 'package:dashboad/features/appointment/data/models/working_hours_model.dart';
import 'package:equatable/equatable.dart';

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

