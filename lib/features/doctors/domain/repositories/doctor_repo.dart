import 'package:dartz/dartz.dart';
import 'package:dashboad/core/data/models/base_model.dart';
import 'package:dashboad/core/domain/error_handler/network_exceptions.dart';
import 'package:dashboad/features/doctors/data/datasources/doctor_remote_data_source.dart';
import 'package:dashboad/features/doctors/data/model/doctor_model.dart';

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

  Future<Either<NetworkExceptions, DoctorModel>> getProfile(
      {required int id}) async {
    try {
      BaseModel model = await _remote.getProfile(id: id);
      DoctorModel doctorModel = DoctorModel.fromJson(model.data);
      return right(doctorModel);
    } catch (error) {
      return left(NetworkExceptions.getException(error));
    }
  }

  Future<Either<NetworkExceptions, Map>> updateProfile(
      {required int id,
      String? firstName,
      String? middleName,
      String? lastName,
      String? phoneNumber,
      String? description,
      required String sectionId,
      required String sessionDuration,
      required String dayInAdvanced,
      //  required Working_hour,
      var image}) async {
    try {
      BaseModel model = await _remote.updateProfile(
          id: id,
          sectionId: sectionId,
          firstName: firstName,
          middleName: middleName,
          lastName: lastName,
          phoneNumber: phoneNumber,
          description: description,
          sessionDuration: sessionDuration,
          dayInAdvanced: dayInAdvanced,
          image: image);

      return right(model.data);
    } catch (error) {
      return left(NetworkExceptions.getException(error));
    }
  }

  Future<Either<NetworkExceptions, Map>> postDoctorSchedule(
      {required int id}) async {
    try {
      BaseModel baseModel = await _remote.addDoctorSchedule(id: id);
      return right(baseModel.data);
    } catch (error) {
      return left(NetworkExceptions.getException(error));
    }
  }

  Future<Either<NetworkExceptions, Map<String, dynamic>>> getDoctorSchedule(
      {required int id}) async {
    try {
      BaseModel baseModel = await _remote.getDoctorSchedule(id: id);
      return right(baseModel.data);
    } catch (error) {
      return left(NetworkExceptions.getException(error));
    }
  }
}
