import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

import '../../core/utils/assets_manager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    navigateToStart();
    super.initState();
  }

  void navigateToStart() {
    Future.delayed(
      const Duration(seconds: 3),
          () {
            context.go('/home');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return  Lottie.asset(
        AssetsManager.loadingPatient,width: 500.w,height: 500.h);
  }

}