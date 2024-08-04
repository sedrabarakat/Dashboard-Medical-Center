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
      String? first_name,
      String? middle_name,
      String? last_name,
      String? phone_number,
      String? description,
      required String Section_id,
      required String Session_duration,
      required String Day_In_Advanced,
    //  required Working_hour,
      var image}) async {
    try {
      BaseModel model = await _remote.updateProfile(
          id: id,
          Section_id: Section_id,
          first_name: first_name,
          middle_name: middle_name,
          last_name: last_name,
          phone_number: phone_number,
          description: description,
          Session_duration: Session_duration,
          Day_In_Advanced: Day_In_Advanced,
          image: image);
      return right(model.data);
    } catch (error) {
      return left(NetworkExceptions.getException(error));
    }
  }
}
