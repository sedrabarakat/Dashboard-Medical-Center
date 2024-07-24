import 'package:dashboad/core/domain/error_handler/network_exceptions.dart';
import 'package:dashboad/features/doctors/data/model/doctor_model.dart';
import 'package:dashboad/features/sections/domain/repositories/section_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'section_state.dart';

class SectionCubit extends Cubit<SectionState> {
  final SectionRepo _repo;
  List<SectionModel> _sections = [];
  SectionCubit(this._repo) : super(SectionInitialState());

  Future<void> createSection() async {
    emit(CreateSectionLoadingState());
    final response = await _repo.createSection("Test Section");
    response.fold(
      (e) => emit(CreateSectionErrorState(e)),
      (data) => emit(CreateSectionSuccessState(data.message)),
    );
  }

  Future<void> updateSection(int id) async {
    emit(UpdateSectionLoadingState());
    final response = await _repo.updateSection(id, 'Updated Section');
    response.fold(
      (e) => emit(UpdateSectionErrorState(e)),
      (data) => emit(UpdateSectionSuccessState(data.data!)),
    );
  }

  Future<void> getSections() async {
    emit(GetSectionsLoadingState());
    final response = await _repo.getSections();
    response.fold((e) {
      emit(GetSectionsErrorState(e));
    }, (data) {
      List<SectionModel> sections =
          data.list.map((section) => section as SectionModel).toList();
      _sections = sections;
      emit(GetSectionsSuccessState(_sections));
    });
  }

  Future<void> getSectionInformation(int id) async {
    emit(GetSectionInformationLoadingState());
    final response = await _repo.getSectionInformation(id);
    response.fold(
      (e) => emit(GetSectionInformationErrorState(e)),
      (data) => emit(
        GetSectionInformationSuccessState(data.data!),
      ),
    );
  }

  Future<void> deleteSection(int id) async {
    final response = await _repo.deleteSection(id);
    response.fold(
      (e) => emit(DeleteSectionErrorState(e)),
      (data) => emit(DeleteSectionSuccessState(data.message)),
    );
  }
}
