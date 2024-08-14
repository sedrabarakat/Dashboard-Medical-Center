import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:dashboad/core/data/datasources/local.dart';
import 'package:dashboad/core/data/models/user_model.dart';
import 'package:dashboad/core/domain/error_handler/network_exceptions.dart';

import 'package:dashboad/core/helpers/json_helper.dart';
import 'package:dashboad/core/widgets/toast_bar.dart';
import 'package:dashboad/features/laboratory/domain/repositories/lab_master_repo.dart';
import 'package:flutter/material.dart';

part 'lab_master_state.dart';

class LabMasterCubit extends Cubit<LabMasterState> {
  final LabMasterRepo _repo;
  LabMasterCubit(this._repo) : super(LabMasterInitialState());
  List<UserModel> _labMaster = [];
  Uint8List? pickedFile;
  String? pickedFileName;
  Future<void> getLabMasters() async {
    List<String> cachedLabMasters =
        await SharedPrefrence.getListOfString('lab-masters');
    // Check if there is cached data if true then return the cached data
    if (cachedLabMasters.isNotEmpty) {
      _labMaster = JsonHelper.convertListOfStringToListOfObjects<UserModel>(
        cachedLabMasters,
        UserModel.fromJson,
      );
      emit(GetLabMasterSuccessState(_labMaster));
      return;
    }
    emit(GetLabMasterLoadingState());
    final response = await _repo.getLabMasters();
    response.fold((error) {
      emit(GetLabMasterErrorState(error));
    }, (data) async {
      List<UserModel> listOfLabMaster =
          data.list.map((labMaster) => labMaster as UserModel).toList();
      _labMaster = listOfLabMaster;
      SharedPrefrence.saveListOfObject(_labMaster, 'lab-masters');
      emit(GetLabMasterSuccessState(_labMaster));
    });
  }

  Future<void> deleteLabMaster(BuildContext context, int id) async {
    UserModel removedLabMaster =
        _labMaster.firstWhere((labMaster) => labMaster.id == id);
    _labMaster.removeWhere((labMaster) => labMaster.id == id);
    final response = await _repo.deleteLabMaster(id);
    response.fold((error) {
      ToastBar.onNetworkFailure(context,
          networkException: error, title: "Error");
      _labMaster.add(removedLabMaster);
      emit(DeleteLabMasterErrorState(error));
    }, (unit) {
      SharedPrefrence.saveListOfObject(_labMaster, 'lab-masters');
      emit(
        DeleteLabMasterSuccessState(_labMaster),
      );
    });
  }
}
