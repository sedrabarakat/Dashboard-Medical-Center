import 'package:dashboad/core/domain/services/api_service.dart';
import 'package:dashboad/core/domain/services/api_services_impl.dart';
import 'package:dashboad/core/helpers/dio_helper.dart';
import 'package:dashboad/features/auth/data/datasrouces/remote/auth_remote.dart';
import 'package:dashboad/features/auth/domain/repositories/auth_repository.dart';
import 'package:dashboad/features/director/domain/repository/director_repo.dart';
import 'package:dashboad/features/doctors/data/datasources/doctor_remote_data_source.dart';
import 'package:dashboad/features/doctors/domain/repositories/doctor_repo.dart';
import 'package:dashboad/features/patients/data/datasources/patient_remote_data_source.dart';
import 'package:dashboad/features/patients/domain/repositories/patient_repo.dart';
import 'package:get_it/get_it.dart';

import '../../../features/director/data/datasource/remote/director_remote_data_source.dart';

final getIt = GetIt.I;

Future locatorSetUp() async {
  getIt.registerLazySingleton<ApiServices>(
    () => ApiServicesImp(DioHelper().dio),
  );
  getIt.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSource(getIt()),
  );
  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepository(getIt()),
  );
  getIt.registerLazySingleton<DirectorRemoteDataSource>(
    () => DirectorRemoteDataSource(getIt()),
  );
  getIt.registerLazySingleton<DirectorRepo>(
    () => DirectorRepo(getIt()),
  );
  getIt.registerLazySingleton<DoctorRemoteDataSource>(
    () => DoctorRemoteDataSource(getIt()),
  );
  getIt.registerLazySingleton<DoctorRepo>(
    () => DoctorRepo(getIt()),
  );
  getIt.registerLazySingleton<PatientRemoteDataSource>(
    () => PatientRemoteDataSource(getIt()),
  );
  getIt.registerLazySingleton<PatientRepo>(
    () => PatientRepo(getIt()),
  );
}
