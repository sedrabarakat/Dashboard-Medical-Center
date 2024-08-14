import 'package:bloc/bloc.dart';
import 'package:dashboad/features/appointment/domain/repositories/appointment_repo.dart';
import 'package:dashboad/features/appointment/presentation/cubit/appointment_state.dart';
import 'package:flutter/cupertino.dart';

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
}
