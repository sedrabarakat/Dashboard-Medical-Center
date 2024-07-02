import 'package:dashboad/core/routing/go_router.dart';
import 'package:dashboad/features/drawer_basiclayout/presentation/cubits/basic_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (BuildContext context) => BasicCubit())],
      child: ScreenUtilInit(
        designSize: const Size(1600, 1000),
        minTextAdapt: true,
        splitScreenMode: true,
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerDelegate: WebRouter.router.routerDelegate,
          routeInformationParser: WebRouter.router.routeInformationParser,
          routeInformationProvider: WebRouter.router.routeInformationProvider,
        ),
      ),
    );
  }
}
