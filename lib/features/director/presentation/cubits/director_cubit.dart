import 'package:bloc/bloc.dart';
import 'package:dashboad/core/data/models/user_model.dart';
import 'package:dashboad/core/domain/error_handler/network_exceptions.dart';
import 'package:dashboad/core/widgets/constants.dart';
import 'package:dashboad/features/director/domain/repositories/director_repo.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'director_state.dart';
part 'director_cubit.freezed.dart';

class DirectorCubit extends Cubit<DirectorState> {
  final DirectorRepo _repo;
  DirectorCubit(this._repo) : super(const DirectorState.initial());
  List<UserModel> _directors = [];
  Future<void> getDirectors() async {
    emit(const DirectorState.directorsLoading());
    final response = await _repo.getDirectors();
    response.fold((error) {
      emit(DirectorState.directorsFailure(error));
    }, (data) {
      List<UserModel> listOfDirectors =
          data.list.map((director) => director as UserModel).toList();
      _directors = listOfDirectors;
      emit(DirectorState.directorsSuccess(_directors));
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
      emit(DirectorState.deleteDirectorFailure(error));
    }, (unit) {
      // emit the initial state because is the previous state equal the current state it will not build the widget tree
      emit(const DirectorState.initial());
      emit(
        DirectorState.deleteDirectorSuccess(_directors),
      );
    });
  }
}
