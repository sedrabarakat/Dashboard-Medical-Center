import 'package:dartz/dartz.dart';
import '../../../../core/domain/error_handler/network_exceptions.dart';
import 'package:dashboad/features/create_account/data/models/patient_model.dart';
import '../../data/models/usermodel.dart';

abstract class CreateRepo {
  Future<Either<NetworkExceptions, Usermodel>> Create_User({
    required String first_name,
    required String middle_name,
    required String last_name,
    required String phone_number,
    required String description,
    required String user_type,
    var image,
    required String password,
  });

  Future<Either<NetworkExceptions, Usermodel>> Create_Doctor({
    required String first_name,
    required String middle_name,
    required String last_name,
    required String phone_number,
    required String description,
    var image,
    required String password,
    required String section_id,
    required String days_in_advance,
    required String session_durtion,
});

  Future<Either<NetworkExceptions, PatientModel>> Create_Patient(
      {required String first_name,
      required String middle_name,
      required String last_name,
      required String phone_number,
      required String description,
      required String birth_date,
      required String age,
      required String gender,
      required String address,
      required String bloodType,
      required String marital_status,
      required int children_num,
      required String habits,
      required String profession,
      required bool diabetes,
      required bool blood_pressure,
      required int wallet,
      required String user_type,
      var image});
}
