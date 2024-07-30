import 'package:dashboad/core/routing/go_router.dart';
import 'package:dashboad/features/drawer_basiclayout/presentation/cubits/basic_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/cubits/bloc_observer.dart';
import 'core/data/datasources/local.dart';
import 'core/domain/services/locator.dart';
import 'core/helpers/token_helper.dart';
import 'core/utils/theme_manager.dart';
import 'features/auth/presentation/cubits/cubit/auth_cubit.dart';

void main() async{
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
          create: (BuildContext context) => BasicCubit(),
        ),
        BlocProvider(
          create: (context) => AuthCubit(getIt()),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(1600, 1000),
        minTextAdapt: true,
        splitScreenMode: true,
        child: MaterialApp.router(
          theme: ThemeManager.lightTheme,
          debugShowCheckedModeBanner: false,
          routerDelegate: WebRouter.router.routerDelegate,
          routeInformationParser: WebRouter.router.routeInformationParser,
          routeInformationProvider: WebRouter.router.routeInformationProvider,
        ),
      ),
    );
  }
}
