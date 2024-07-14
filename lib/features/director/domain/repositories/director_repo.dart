import 'package:dartz/dartz.dart';
import 'package:dashboad/core/data/models/base_model.dart';
import 'package:dashboad/core/domain/error_handler/network_exceptions.dart';
import 'package:dashboad/features/director/data/datasources/remote/director_remote_data_source.dart';

class DirectorRepo {
  final DirectorRemoteDataSource _remote;
  DirectorRepo(this._remote);
  Future<Either<NetworkExceptions, BaseModels>> getDirectors() async {
    try {
      final response = await _remote.getDirectors();
      return right(response);
    } catch (error) {
      return left(NetworkExceptions.getException(error));
    }
  }
}
