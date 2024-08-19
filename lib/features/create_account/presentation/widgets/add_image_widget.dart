
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/colors_helper.dart';
import '../../../../core/utils/style_manager.dart';
import '../cubits/add_account_cubit.dart';

Widget AddImage({
  required context
}){
  AddAccountCubit cubit=AddAccountCubit.get(context);
  return Expanded(
    child: Container(
      clipBehavior: Clip.hardEdge,
      height: 250.h,width: 300.w,
      decoration: StyleManager.Circle_Shape(color: ColorsHelper.blueLightest),
      child: IconButton(onPressed: (){
        cubit.addImage();
      },icon: (cubit.Image_Bytes!=null)?Image.memory(
          Uint8List.fromList(cubit.Image_Bytes!),fit: BoxFit.cover,
      ):Icon(Icons.add_a_photo,size: 30.w,color: Colors.white,),),
    ),
  );
}