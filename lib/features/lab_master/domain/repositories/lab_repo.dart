import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:dashboad/core/data/models/base_model.dart';
import 'package:dashboad/core/domain/error_handler/network_exceptions.dart';
import 'package:dashboad/features/lab_master/data/datasources/lab_remote.dart';
import 'package:flutter/material.dart';

class LabRepo {
  final LabRemoteDataSource _remote;
  LabRepo(this._remote);
  Future<Either<NetworkExceptions, BaseModels>> getLabRequest(
      String? search, String status) async {
    try {
      final response = await _remote.getLabRequet(search, status);
      return right(response);
    } catch (error) {
      return left(NetworkExceptions.getException(error));
    }
  }

  Future<Either<NetworkExceptions, BaseModel>> makeItDone(int id) async {
    try {
      final response = await _remote.makeItDone(id);
      return right(response);
    } catch (error) {
      return left(NetworkExceptions.getException(error));
    }
  }

  Future<Either<NetworkExceptions, BaseModel>> makeItFail(int id) async {
    try {
      final response = await _remote.makeItFail(id);
      return right(response);
    } catch (error) {
      return left(NetworkExceptions.getException(error));
    }
  }

  Future<Either<NetworkExceptions, BaseModels>> getServices() async {
    try {
      final response = await _remote.getServices();
      return right(response);
    } catch (error) {
      return left(NetworkExceptions.getException(error));
    }
  }

  Future<Either<NetworkExceptions, BaseModel>> uploadFile({
    required int sessionDetailsId,
    required Uint8List file,
    required String fileType,
    required String fileName,
    required BuildContext context,
  }) async {
    try {
      final response = await _remote.uploadFile(
        sessionDetailsId,
        file,
        fileType,
        fileName,
        context,
      );
      return right(response);
    } catch (error) {
      return left(NetworkExceptions.getException(error));
    }
  }
}
