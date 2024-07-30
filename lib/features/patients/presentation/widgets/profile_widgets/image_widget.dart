import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/helpers/colors_helper.dart';
import '../../../../../core/utils/style_manager.dart';

Widget Image_widget(){
  return Container(
    clipBehavior: Clip.hardEdge,
    height: 250.h,width: 200.w,
    decoration: StyleManager.Circle_Shape(color: ColorsHelper.black26),
    child: IconButton(onPressed: (){},icon: Icon(Icons.person,size: 30.w,),),
  );
}