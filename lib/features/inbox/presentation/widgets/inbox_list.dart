import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/style_manager.dart';
import '../cubits/inbox.dart';

Widget inbox_list({required context}){
  inbox_cubit cubit=inbox_cubit.get(context);
  return  Expanded(
    child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: 80.w, vertical: 50.h),
        height: 700.h,
        decoration: StyleManager.rounded40(
            color: Colors.white),
        child: ListView.separated(
            itemBuilder: (context,index) => Container(
              padding: EdgeInsets.all(20.h),
              width: 500.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  gradient: StyleManager.primiryGradients
              ),
              child: Text(
                cubit.complaints[index].text,
                style: StyleManager.font20W600,
              ),
            ),
            separatorBuilder:  (context,index) =>SizedBox(
              height: 20.h,
            ),
            itemCount: cubit.complaints.length)
    ));
}