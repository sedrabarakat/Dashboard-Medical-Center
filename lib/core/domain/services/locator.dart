import 'package:dashboad/core/domain/services/api_service.dart';
import 'package:dashboad/core/domain/services/api_services_impl.dart';
import 'package:dashboad/core/helpers/dio_helper.dart';
import 'package:dashboad/features/auth/data/datasrouces/remote/auth_remote.dart';
import 'package:dashboad/features/auth/domain/respositories/auth_repository.dart';
import 'package:get_it/get_it.dart';

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
}
