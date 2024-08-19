import 'dart:ui';

import 'package:dashboad/core/helpers/colors_helper.dart';
import 'package:dashboad/core/utils/style_manager.dart';
import 'package:dashboad/features/home/presentation/cubit/home_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget rowNumWidget(context){
  HomeCubit cubit=HomeCubit.get(context);
  return Row(
    children: [
      numWidget(num: cubit.count['employee'], icon: Icons.people_outline_sharp,type: 'Admin',
      color: ColorsHelper.blue.withOpacity(.9)),
      SizedBox(width: 22.w,),
      numWidget(num: cubit.count['doctors'], icon: Icons.medical_services_rounded,type: 'Doctors',
          color: ColorsHelper.blue.withOpacity(.8)),
      SizedBox(width: 22.w,),
      numWidget(num: cubit.count['patient'], icon: CupertinoIcons.person_fill,type: 'Patient',
          color: ColorsHelper.blue.withOpacity(.9))
    ],
  );
}

Widget numWidget({
  required String type,
  required int num,
  required IconData icon,
required Color color}){
  return Flexible(
    child: Container(
      height: 100.h,
      width: 300.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: CupertinoColors.white,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(width: 50.w,),
          Icon(icon,color: color,size: 60.w,),
          SizedBox(width: 50.w,),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Text('$type',style: StyleManager.fontBoldGry,),
            Text('$num',style: StyleManager.fontBold,)
          ],)
        ],
      ),
    ),
  );
}