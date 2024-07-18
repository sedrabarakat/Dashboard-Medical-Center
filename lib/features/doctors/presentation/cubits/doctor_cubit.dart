import 'package:bloc/bloc.dart';
import 'package:dashboad/core/data/datasources/local.dart';
import 'package:dashboad/core/domain/error_handler/network_exceptions.dart';
import 'package:dashboad/core/helpers/json_helper.dart';
import 'package:dashboad/core/widgets/toast_bar.dart';
import 'package:dashboad/features/doctors/data/model/doctor_model.dart';
import 'package:dashboad/features/doctors/domain/repositories/doctor_repo.dart';
import 'package:flutter/material.dart';

part 'doctor_state.dart';

class DoctorCubit extends Cubit<DoctorState> {
  final DoctorRepo _repo;
  DoctorCubit(this._repo) : super(DoctorInitialState());
  List<DoctorModel> _doctors = [];
  Future<void> getDoctors() async {
    List<String> cachedDoctors = await SharedPrefrence.getListOfString('doctors');
    // Check if there is cached data if true then return the cached data
    if (cachedDoctors.isNotEmpty) {
      _doctors = JsonHelper.convertListOfStringToListOfObjects<DoctorModel>(
        cachedDoctors,
        DoctorModel.fromJson,
      );
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

  Future<void> deleteDoctors(BuildContext context, int id) async {
    DoctorModel removedDoctor =
        _doctors.firstWhere((doctor) => doctor.id == id);
    _doctors.removeWhere((doctor) => doctor.id == id);
    final response = await _repo.deleteDoctors(id);
    response.fold((error) {
      ToastBar.onNetworkFailure(context,
          networkException: error, title: "Error");
      _doctors.add(removedDoctor);
      emit(DeleteDoctorErrorState(error));
    }, (unit) {
      SharedPrefrence.saveListOfObject(_doctors, 'doctors');
      emit(
        DeleteDoctorSuccessState(_doctors),
      );
    });
  }
}
