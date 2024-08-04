import 'package:dartz/dartz.dart';
import 'package:dashboad/core/data/models/base_model.dart';
import 'package:dashboad/core/domain/error_handler/network_exceptions.dart';
import 'package:dashboad/features/laboratory/data/data_sources/laboratory_remote_data_source.dart';

class LabMasterRepo {
  final LaboratoryRemoteDataSource _remote;
  LabMasterRepo(this._remote);
  Future<Either<NetworkExceptions, BaseModels>> getLabMasters() async {
    try {
      final response = await _remote.getLabMasters();
      return right(response);
    } catch (error) {
      return left(NetworkExceptions.getException(error));
    }
  }

  Future<Either<NetworkExceptions, Unit>> deleteLabMaster(int id) async {
    try {
      await _remote.deleteLabMaster(id);
      return right(unit);
    } catch (error) {
      return left(NetworkExceptions.getException(error));
    }
  }
}
