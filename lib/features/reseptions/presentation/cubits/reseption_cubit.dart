import 'package:bloc/bloc.dart';
import 'package:dashboad/core/data/datasources/local.dart';
import 'package:dashboad/core/data/models/user_model.dart';
import 'package:dashboad/core/domain/error_handler/network_exceptions.dart';
import 'package:dashboad/core/helpers/json_helper.dart';
import 'package:dashboad/core/widgets/toast_bar.dart';
import 'package:dashboad/features/reseptions/domain/repository/reseptions_repo.dart';
import 'package:flutter/material.dart';

part 'reseption_state.dart';

class ReseptionCubit extends Cubit<ReseptionState> {
  final ReseptionsRepo _repo;
  ReseptionCubit(this._repo) : super(ReseptionInitialState());
  List<UserModel> _reseptions = [];
  Future<void> getReseptions() async {
    List<String> cachedReseptions =
        await SharedPrefrence.getListOfString('reseptions');
    // Check if there is cached data if true then return the cached data
    if (cachedReseptions.isNotEmpty) {
      _reseptions = JsonHelper.convertListOfStringToListOfObjects<UserModel>(
        cachedReseptions,
        UserModel.fromJson,
      );
      emit(GetReseptionsSuccessState(_reseptions));
      return;
    }
    emit(GetReseptionsLoadingState());
    final response = await _repo.getReseptions();
    response.fold((error) {
      emit(GetReseptionsErrorState(error));
    }, (data) {
      List<UserModel> listOfReseptions =
          data.list.map((reseption) => reseption as UserModel).toList();
      _reseptions = listOfReseptions;
      SharedPrefrence.saveListOfObject(_reseptions, 'reseptions');
      emit(GetReseptionsSuccessState(_reseptions));
    });
  }

  Future<void> deleteReseptionist(BuildContext context, int id) async {
    UserModel removedReseptionist =
        _reseptions.firstWhere((reseptions) => reseptions.id == id);
    _reseptions.removeWhere((reseptions) => reseptions.id == id);
    final response = await _repo.deleteReceptionist(id);
    response.fold((error) {
      ToastBar.onNetworkFailure(context,
          networkException: error, title: "Error");
      _reseptions.add(removedReseptionist);
      emit(DeleteReseptionErrorState(error));
    }, (unit) {
      SharedPrefrence.saveListOfObject(_reseptions, 'reseptions');
      emit(
        DeleteReseptionSuccessState(_reseptions),
      );
    });
  }
}
