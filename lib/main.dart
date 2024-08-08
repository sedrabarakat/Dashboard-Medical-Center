import 'package:dashboad/core/routing/go_router.dart';
import 'package:dashboad/features/create_account/presentation/cubits/add_account_cubit.dart';
import 'package:dashboad/features/doctors/presentation/cubits/doctor_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/cubits/bloc_observer.dart';
import 'core/data/datasources/local.dart';
import 'core/domain/services/locator.dart';
import 'core/helpers/token_helper.dart';
import 'core/utils/theme_manager.dart';
import 'features/auth/presentation/cubits/cubit/auth_cubit.dart';
import 'features/patients/presentation/cubits/patient_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefrence.init();
  await TokenHelper.init();
  await locatorSetUp();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit(getIt()),
        ),
        BlocProvider(create: (context) => AddAccountCubit(getIt(), getIt())),
        BlocProvider(
          create: (context) => PatientCubit(getIt())..getPatients(),
        ),
        BlocProvider(
          create: (context) => DoctorCubit(getIt())..getDoctors(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(1600, 1000),
        minTextAdapt: true,
        splitScreenMode: true,
        child: MaterialApp.router(
          theme: ThemeManager.lightTheme,
          debugShowCheckedModeBanner: false,
          routerConfig: WebRouter.router,
        ),
      ),
    );
  }
}
