import 'package:dartz/dartz.dart';
import 'package:dashboad/core/data/models/base_model.dart';
import 'package:dashboad/core/domain/error_handler/network_exceptions.dart';
import 'package:dashboad/features/reseptions/data/datasource/remote/reseptions_remote_data_source.dart';

class ReseptionsRepo {
  final ReseptionsRemoteDataSource _remote;
  ReseptionsRepo(this._remote);
  Future<Either<NetworkExceptions, BaseModels>> getReseptions() async {
    try {
      final response = await _remote.getReseptions();
      return right(response);
    } catch (error) {
      return left(NetworkExceptions.getException(error));
    }
  }

  Future<Either<NetworkExceptions, Unit>> deleteReceptionist(int id) async {
    try {
      await _remote.deleteReceptionist(id);
      return right(unit);
    } catch (error) {
      return left(NetworkExceptions.getException(error));
    }
  }
}
