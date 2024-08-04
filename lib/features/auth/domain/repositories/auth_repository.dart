import 'package:dartz/dartz.dart';
import 'package:dashboad/core/domain/error_handler/network_exceptions.dart';
import 'package:dashboad/features/auth/data/datasrouces/remote/auth_remote.dart';

class AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;
  AuthRepository(this._remoteDataSource);
  Future<Either<NetworkExceptions, Unit>> requestCode(
      String phoneNumber, String password) async {
    try {
      await _remoteDataSource.requestCode(phoneNumber, password);
      return right(unit);
    } catch (e) {
      return left(NetworkExceptions.getException(e));
    }
  }

  Future<Either<NetworkExceptions, Map<String,dynamic>>> verifyCode(
      String phoneNumber, String code) async {
    try {
      final response = await _remoteDataSource.verifyCode(phoneNumber, code);
      return right(response.data!);
    } catch (e) {
      return left(NetworkExceptions.getException(e));
    }
  }
}
