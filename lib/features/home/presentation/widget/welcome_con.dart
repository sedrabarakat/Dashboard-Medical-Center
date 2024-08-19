import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/data/datasources/local.dart';
import '../../../../core/helpers/colors_helper.dart';
import '../../../../core/widgets/animated_text.dart';

Widget WelcomeCon(){
  return Expanded(
    flex: 1,
    child: Padding(
      padding: EdgeInsets.symmetric(
          horizontal: 50.h,vertical: 20.w
      ),
      child: Container(
        width: 1600.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            color: ColorsHelper.white
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 30.w),
          child: liquedText(
              text: 'Welcome Back ${SharedPrefrence.prefs!.get('Name')}',
              waveColor: ColorsHelper.primary,
              backgroundColor: Colors.white),
        ),
      ),
    ),
  );
}