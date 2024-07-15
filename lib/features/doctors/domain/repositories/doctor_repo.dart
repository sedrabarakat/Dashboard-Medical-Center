import 'package:dartz/dartz.dart';
import 'package:dashboad/core/data/models/base_model.dart';
import 'package:dashboad/core/domain/error_handler/network_exceptions.dart';
import 'package:dashboad/features/doctors/data/datasources/doctor_remote_data_source.dart';

class DoctorRepo {
  final DoctorRemoteDataSource _remote;
  DoctorRepo(this._remote);
  Future<Either<NetworkExceptions, BaseModels>> getDoctors() async {
    try {
      final response = await _remote.getDoctors();
      return right(response);
    } catch (error) {
      return left(NetworkExceptions.getException(error));
    }
  }

  Future<Either<NetworkExceptions, Unit>> deleteDoctors(int id) async {
    try {
      await _remote.deleteDoctor(id);
      return right(unit);
    } catch (error) {
      return left(NetworkExceptions.getException(error));
    }
  }
}
