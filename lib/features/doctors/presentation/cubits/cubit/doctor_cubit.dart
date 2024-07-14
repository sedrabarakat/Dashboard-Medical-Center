import 'package:bloc/bloc.dart';
import 'package:dashboad/core/domain/error_handler/network_exceptions.dart';
import 'package:dashboad/core/widgets/constants.dart';
import 'package:dashboad/features/doctors/data/model/doctor_model.dart';
import 'package:dashboad/features/doctors/domain/repositories/doctor_repo.dart';
import 'package:flutter/material.dart';

part 'doctor_state.dart';

class DoctorCubit extends Cubit<DoctorState> {
  final DoctorRepo _repo;
  DoctorCubit(this._repo) : super(DoctorInitialState());
  List<DoctorModel> _doctors = [];
  Future<void> getDoctors() async {
    emit(GetDoctorsLoadingState());
    final response = await _repo.getDoctors();
    response.fold((error) {
      emit(GetDoctorsErrorState(error));
    }, (data) {
      List<DoctorModel> listOfDoctors =
          data.list.map((doctors) => doctors as DoctorModel).toList();
      _doctors = listOfDoctors;
      emit(GetDoctorsSuccessState(_doctors));
    });
  }

  Future<void> deleteDoctors(BuildContext context, int id) async {
    DoctorModel removedDoctor =
        _doctors.firstWhere((doctor) => doctor.id == id);
    _doctors.removeWhere((doctor) => doctor.id == id);
    final response = await _repo.deleteDoctors(id);
    response.fold((error) {
      Constants.onNetworkFailure(context,
          networkException: error, title: "Error");
      _doctors.add(removedDoctor);
      emit(DeleteDoctorErrorState(error));
    }, (unit) {
      emit(
        DeleteDoctorSuccessState(_doctors),
      );
    });
  }
}
