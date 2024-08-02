import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:dashboad/core/data/models/base_model.dart';
import 'package:dashboad/core/domain/error_handler/network_exceptions.dart';

import 'package:dashboad/features/sections/data/data_sources/section_remote_data_srouce.dart';
import 'package:dashboad/features/sections/data/models/section_model.dart';

class SectionRepo {
  final SectionRemoteDataSrouce _remote;
  SectionRepo(this._remote);
  Future<Either<NetworkExceptions, BaseModel<SectionModel>>> createSection(
      String name, Uint8List image, List<SectionService> services) async {
    try {
      final response = await _remote.createSection(name, image);
      // TODO tell the backend to remove the description
      for (int i = 0; i < services.length; i++) {
        await _remote.createService(services[i].name, 'description',
            services[i].price, response.data!.id.toString());
      }
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

  Future<Either<NetworkExceptions, BaseModel<SectionService>>> createService(
      String name, String price, String description, String sectionId) async {
    try {
      final response =
          await _remote.createService(name, description, price, sectionId);
      return right(response);
    } catch (error) {
      return left(NetworkExceptions.getException(error));
    }
  }

  Future<Either<NetworkExceptions, BaseModel>> deleteService(int id) async {
    try {
      final response = await _remote.deleteService(id);
      return right(response);
    } catch (e) {
      return left(NetworkExceptions.getException(e));
    }
  }

  Future<Either<NetworkExceptions, BaseModel<SectionService>>> editService(
      int serviceId,
      String name,
      String price,
      String description,
      String sectionId) async {
    try {
      final response = await _remote.editService(
          serviceId, name, price, description, sectionId);
      return right(response);
    } catch (error) {
      return left(NetworkExceptions.getException(error));
    }
  }
}
