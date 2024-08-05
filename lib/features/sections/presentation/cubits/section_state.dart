part of 'section_cubit.dart';

abstract class SectionState {}

class SectionInitialState extends SectionState {}

class GetSectionsLoadingState extends SectionState {}

class GetSectionsSuccessState extends SectionState {
  final List<SectionModel> sections;
  GetSectionsSuccessState(this.sections);
}

class GetSectionsErrorState extends SectionState {
  final NetworkExceptions error;
  GetSectionsErrorState(this.error);
}

class CreateSectionLoadingState extends SectionState {}

class CreateSectionErrorState extends SectionState {
  final NetworkExceptions error;
  CreateSectionErrorState(this.error);
}

class CreateSectionSuccessState extends SectionState {
  String message;
  CreateSectionSuccessState(this.message);
}

class UpdateSectionLoadingState extends SectionState {}

class UpdateSectionSuccessState extends SectionState {
  final SectionModel section;
  UpdateSectionSuccessState(this.section);
}

class UpdateSectionErrorState extends SectionState {
  final NetworkExceptions error;
  UpdateSectionErrorState(this.error);
}

class GetSectionInformationLoadingState extends SectionState {}

class GetSectionInformationErrorState extends SectionState {
  final NetworkExceptions error;
  GetSectionInformationErrorState(this.error);
}

class GetSectionInformationSuccessState extends SectionState {
  final SectionModel section;
  GetSectionInformationSuccessState(this.section);
}

class DeleteSectionSuccessState extends SectionState {
  final String message;
  DeleteSectionSuccessState(this.message);
}

class DeleteSectionErrorState extends SectionState {
  final NetworkExceptions error;
  DeleteSectionErrorState(this.error);
}

class DeleteServiceSuccessState extends SectionState {
  final String message;
  DeleteServiceSuccessState(this.message);
}

class DeleteServiceErrorState extends SectionState {
  final NetworkExceptions error;
  DeleteServiceErrorState(this.error);
}

class EditServiceSuccessState extends SectionState {
  final SectionService service;
  EditServiceSuccessState(this.service);
}

class EditServiceErrorState extends SectionState {
  final NetworkExceptions error;
  EditServiceErrorState(this.error);
}

class EditServiceLoadingState extends SectionState {}

class AddSectionService extends SectionState {}

class RemoveSectionService extends SectionState {}
