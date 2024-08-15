import 'package:bloc/bloc.dart';
import 'package:dashboad/features/appointment/domain/repositories/appointment_repo.dart';
import 'package:dashboad/features/appointment/presentation/cubit/appointment_state.dart';
import 'package:flutter/cupertino.dart';

import '../../../../core/widgets/toast_bar.dart';
import '../../data/models/appointment_model.dart';

class AppointmentCubit extends Cubit<AppointmentState> {
  final AppointmentRepo _repo;

  AppointmentCubit(this._repo) : super(AppointmentInitialState());
  List<AppointmentModel> _appointments = [];

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
}
