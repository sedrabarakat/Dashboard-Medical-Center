import 'package:bloc/bloc.dart';
import 'package:dashboad/core/data/models/user_model.dart';
import 'package:dashboad/core/domain/error_handler/network_exceptions.dart';
import 'package:dashboad/features/director/domain/repositories/director_repo.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'director_state.dart';
part 'director_cubit.freezed.dart';

class DirectorCubit extends Cubit<DirectorState> {
  final DirectorRepo _repo;
  DirectorCubit(this._repo) : super(const DirectorState.initial());
  Future<void> getDirectors() async {
    emit(const DirectorState.directorsLoading());
    final response = await _repo.getDirectors();
    response.fold((error) {
      emit(DirectorState.directorsFailure(error));
    }, (data) {
      List<UserModel> directors =
          data.list.map((director) => director as UserModel).toList();
      emit(DirectorState.directorsSuccess(directors));
    });
  }
}
