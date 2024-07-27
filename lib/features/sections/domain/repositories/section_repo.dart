import 'package:dartz/dartz.dart';
import 'package:dashboad/core/data/models/base_model.dart';
import 'package:dashboad/core/domain/error_handler/network_exceptions.dart';

import 'package:dashboad/features/sections/data/data_sources/section_remote_data_srouce.dart';
import 'package:dashboad/features/sections/data/models/section_model.dart';

class SectionRepo {
  final SectionRemoteDataSrouce _remote;
  SectionRepo(this._remote);
  Future<Either<NetworkExceptions, BaseModel>> createSection(
      String name) async {
    try {
      final response = await _remote.createSection(name);
      return right(response);
    } catch (error) {
      return left(NetworkExceptions.getException(error));
    }
  }

  Future<Either<NetworkExceptions, BaseModel<SectionModel>>> updateSection(
      int id, String name) async {
    try {
      final response = await _remote.updateSection(id, name);
      return right(response);
    } catch (e) {
      return left(NetworkExceptions.getException(e));
    }
  }

  Future<Either<NetworkExceptions, BaseModels>> getSections() async {
    try {
      final response = await _remote.getSections();
      return right(response);
    } catch (error) {
      return left(NetworkExceptions.getException(error));
    }
  }

  Future<Either<NetworkExceptions, BaseModel<SectionModel>>>
      getSectionInformation(int id) async {
    try {
      final response = await _remote.getSectionInformation(id);
      return right(response);
    } catch (error) {
      return left(NetworkExceptions.getException(error));
    }
  }

  Future<Either<NetworkExceptions, BaseModel>> deleteSection(int id) async {
    try {
      final response = await _remote.deleteSection(id);
      return right(response);
    } catch (error) {
      return left(NetworkExceptions.getException(error));
    }
  }
}
