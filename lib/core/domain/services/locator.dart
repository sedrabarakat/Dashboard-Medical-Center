import 'package:dashboad/core/domain/services/api_service.dart';
import 'package:dashboad/core/domain/services/api_services_impl.dart';
import 'package:dashboad/core/helpers/dio_helper.dart';
import 'package:dashboad/features/appointment/data/data_sources/remote/appointment_remote.dart';
import 'package:dashboad/features/appointment/domain/repositories/appointment_repo.dart';
import 'package:dashboad/features/auth/data/datasrouces/remote/auth_remote.dart';
import 'package:dashboad/features/auth/domain/repositories/auth_repository.dart';
import 'package:dashboad/features/create_account/data/repository/create_repo_impl.dart';
import 'package:dashboad/features/create_account/domain/repository/create_repo.dart';
import 'package:dashboad/features/director/domain/repository/director_repo.dart';
import 'package:dashboad/features/doctors/data/datasources/doctor_remote_data_source.dart';
import 'package:dashboad/features/doctors/domain/repositories/doctor_repo.dart';
import 'package:dashboad/features/home/data/home_repo.dart';
import 'package:dashboad/features/home/data/home_remote.dart';
import 'package:dashboad/features/inbox/data/data_source/inbox_remote.dart';
import 'package:dashboad/features/inbox/data/repository/inbox_repo.dart';
import 'package:dashboad/features/lab_master/data/datasources/lab_remote.dart';
import 'package:dashboad/features/lab_master/domain/repositories/lab_repo.dart';
import 'package:dashboad/features/laboratory/data/data_sources/laboratory_remote_data_source.dart';
import 'package:dashboad/features/laboratory/domain/repositories/lab_master_repo.dart';
import 'package:dashboad/features/patients/data/datasources/patient_remote_data_source.dart';
import 'package:dashboad/features/patients/domain/repositories/patient_repo.dart';
import 'package:dashboad/features/reseptions/data/datasource/remote/reseptions_remote_data_source.dart';
import 'package:dashboad/features/reseptions/domain/repository/reseptions_repo.dart';
import 'package:dashboad/features/sections/data/data_sources/section_remote_data_srouce.dart';
import 'package:dashboad/features/sections/domain/repositories/section_repo.dart';
import 'package:dashboad/features/sections/presentation/cubits/section_cubit.dart';
import 'package:get_it/get_it.dart';
import '../../../features/create_account/data/data_source/remote/create_remote.dart';
import '../../../features/create_account/data/data_source/remote/get_sections_remote.dart';
import '../../../features/create_account/data/repository/sections_repo_impl.dart';
import '../../../features/create_account/domain/repository/get_sections_repo.dart';
import '../../../features/director/data/datasource/remote/director_remote_data_source.dart';

final getIt = GetIt.I;

Future locatorSetUp() async {
  getIt.registerLazySingleton<ApiServices>(
    () => ApiServicesImp(DioHelper().dio),
  );
  /*>>>>>>>>>> Auth <<<<<<<<<<*/
  getIt.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSource(getIt()),
  );
  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepository(getIt()),
  );
  /*>>>>>>>>>> Director <<<<<<<<<<*/
  getIt.registerLazySingleton<DirectorRemoteDataSource>(
    () => DirectorRemoteDataSource(getIt()),
  );
  getIt.registerLazySingleton<DirectorRepo>(
    () => DirectorRepo(getIt()),
  );
  /*>>>>>>>>>> Doctor <<<<<<<<<<*/
  getIt.registerLazySingleton<DoctorRemoteDataSource>(
    () => DoctorRemoteDataSource(getIt()),
  );
  getIt.registerLazySingleton<DoctorRepo>(
    () => DoctorRepo(getIt()),
  );
  /*>>>>>>>>>> Patient <<<<<<<<<<*/
  getIt.registerLazySingleton<PatientRemoteDataSource>(
    () => PatientRemoteDataSource(getIt()),
  );
  getIt.registerLazySingleton<PatientRepo>(
    () => PatientRepo(getIt()),
  );
  /*>>>>>>>>>> Reseptions <<<<<<<<<<*/
  getIt.registerLazySingleton<ReseptionsRemoteDataSource>(
    () => ReseptionsRemoteDataSource(getIt()),
  );
  getIt.registerLazySingleton<ReseptionsRepo>(
    () => ReseptionsRepo(getIt()),
  );
  /*>>>>>>>>>> Create Account <<<<<<<<<<*/
  getIt.registerLazySingleton<CreateRepo>(
    () => CreateRepoImpl(getIt()),
  );
  getIt.registerLazySingleton<CreateRemoteDataSource>(
    () => CreateRemoteDataSource(getIt()),
  );
  getIt.registerLazySingleton<AppointmentRemote>(
      () => AppointmentRemote(getIt()));
  getIt.registerLazySingleton<AppointmentRepo>(() => AppointmentRepo(getIt()));

  /*>>>>>>>>>> Lab Master <<<<<<<<<<*/
  getIt.registerLazySingleton<LaboratoryRemoteDataSource>(
    () => LaboratoryRemoteDataSource(getIt()),
  );
  getIt.registerLazySingleton<LabMasterRepo>(
    () => LabMasterRepo(getIt()),
  );
  /*>>>>>>>>>> Sections <<<<<<<<<<*/
  getIt.registerLazySingleton<SectionRemoteDataSrouce>(
    () => SectionRemoteDataSrouce(getIt()),
  );
  getIt.registerLazySingleton<SectionRepo>(
    () => SectionRepo(getIt()),
  );
  /*>>>>>>>>>> Cubits <<<<<<<<<<*/
  getIt.registerLazySingleton<SectionCubit>(
    () => SectionCubit(getIt()),
  );
  /*>>>>>>>>>> GetSections in Create <<<<<<<<<<*/
  getIt.registerLazySingleton<GetSectionsRemote>(
    () => GetSectionsRemote(getIt()),
  );
  getIt.registerLazySingleton<GetSectionsRepo>(
    () => GetSectionsRepoImp(getIt()),
  );
  /*>>>>>>>>>> Lab <<<<<<<<<<*/
  getIt.registerLazySingleton<LabRemoteDataSource>(
    () => LabRemoteDataSource(getIt()),
  );
  getIt.registerLazySingleton<LabRepo>(
    () => LabRepo(getIt()),
  );
  /*>>>>>>>>>> Inbox <<<<<<<<<<*/
  getIt.registerLazySingleton<InboxRemote>(
        () => InboxRemote(getIt()),
  );
  getIt.registerLazySingleton<InboxRepo>(
        () => InboxRepo(getIt()),
  );
  /*>>>>>>>>>> Home <<<<<<<<<<*/
  getIt.registerLazySingleton<HomeRemote>(
        () => HomeRemote(getIt()),
  );
  getIt.registerLazySingleton<HomeRepo>(
        () => HomeRepo(getIt()),
  );
}
