import 'package:dashboad/core/domain/error_handler/network_exceptions.dart';
import 'package:equatable/equatable.dart';

import '../../data/models/appointment_model.dart';

class AppointmentState extends Equatable{
  const AppointmentState();

  @override
  List<Object> get props => [];
}

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
