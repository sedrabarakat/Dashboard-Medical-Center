import 'package:dartz/dartz.dart';
import 'package:dashboad/core/data/models/base_model.dart';
import 'package:dashboad/core/domain/error_handler/network_exceptions.dart';
import 'package:dashboad/features/create_account/data/models/patient_model.dart';
import 'package:dashboad/features/create_account/data/models/usermodel.dart';
import 'package:dashboad/features/create_account/domain/repository/create_repo.dart';

import '../data_source/remote/create_remote.dart';

class CreateRepoImpl extends CreateRepo {
  CreateRemoteDataSource remoteDataSource;

  CreateRepoImpl(this.remoteDataSource);

  @override
  Future<Either<NetworkExceptions, Usermodel>> Create_Director({
    required String first_name,
    required String middle_name,
    required String last_name,
    required String phone_number,
    required String description,
  }) async {
    try {
      Usermodel data = await remoteDataSource.create_director(
          first_name: first_name,
          middle_name: middle_name,
          last_name: last_name,
          phone_number: phone_number,
          description: description);
      return right(data);
    } catch (e) {
      return left(NetworkExceptions.getException(e));
    }
  }

  @override
  Future<Either<NetworkExceptions, Usermodel>> Create_Doctor() {
    // TODO: implement Create_Doctor
    throw UnimplementedError();
  }

  @override
  Future<Either<NetworkExceptions, Usermodel>> Create_LabMaster() {
    // TODO: implement Create_LabMaster
    throw UnimplementedError();
  }

  @override
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
      required String user_type}) async {
    try {
      BaseModel baseModel = await remoteDataSource.create_patient(
          first_name: first_name,
          middle_name: middle_name,
          last_name: last_name,
          phone_number: phone_number,
          description: description,
          birth_date: birth_date,
          age: age,
          gender: gender,
          address: address,
          bloodType: bloodType,
          marital_status: marital_status,
          children_num: children_num,
          habits: habits,
          profession: profession,
          diabetes: diabetes,
          blood_pressure: blood_pressure,
          wallet: wallet,
          user_type: user_type);

      PatientModel patientModel = PatientModel.fromJson(baseModel.data);
      return right(patientModel);
    } catch (e) {
      return left(NetworkExceptions.getException(e));
    }
  }

  @override
  Future<Either<NetworkExceptions, Usermodel>> Create_Reception() {
    // TODO: implement Create_Reception
    throw UnimplementedError();
  }
}
