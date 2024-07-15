import 'package:bloc/bloc.dart';
import 'package:dashboad/core/data/datasources/local.dart';
import 'package:dashboad/core/data/models/user_model.dart';
import 'package:dashboad/core/domain/error_handler/network_exceptions.dart';
import 'package:dashboad/core/helpers/json_helper.dart';
import 'package:dashboad/core/widgets/constants.dart';
import 'package:dashboad/features/director/domain/repositories/director_repo.dart';
import 'package:flutter/material.dart';

part 'director_state.dart';

class DirectorCubit extends Cubit<DirectorState> {
  final DirectorRepo _repo;
  DirectorCubit(this._repo) : super(DirectorInitialState());
  List<UserModel> _directors = [];
  Future<void> getDirectors() async {
    List<String> cachedDirectors =
        await HandleShared.getListOfString('directors');
    // Check if there is cached data if true then return the cached data
    if (cachedDirectors.isNotEmpty) {
      _directors = JsonHelper.convertListOfStringToListOfObjects<UserModel>(
        cachedDirectors,
        UserModel.fromJson,
      );
      emit(GetDirectorsSuccessState(_directors));
      return;
    }
    emit(GetDirectorsLoadingState());
    final response = await _repo.getDirectors();
    response.fold((error) {
      emit(GetDirectorsErrorState(error));
    }, (data) {
      List<UserModel> listOfDirectors =
          data.list.map((director) => director as UserModel).toList();
      _directors = listOfDirectors;
      HandleShared.saveListOfObject(_directors, 'directors');
      emit(GetDirectorsSuccessState(_directors));
    });
  }

  Future<void> deleteDirector(BuildContext context, int id) async {
    UserModel removedDirector =
        _directors.firstWhere((director) => director.id == id);
    _directors.removeWhere((director) => director.id == id);
    final response = await _repo.deleteDirector(id);
    response.fold((error) {
      Constants.onNetworkFailure(context,
          networkException: error, title: "Error");
      _directors.add(removedDirector);
      emit(DeleteDirectorErrorState(error));
    }, (unit) {
      HandleShared.saveListOfObject(_directors, 'directors');
      emit(
        DeleteDirectorSuccessState(_directors),
      );
    });
  }
}
