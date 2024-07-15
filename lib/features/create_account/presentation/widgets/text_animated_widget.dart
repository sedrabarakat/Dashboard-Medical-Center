import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:dashboad/features/create_account/presentation/cubits/add_account_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/style_manager.dart';
import '../../../../core/widgets/animated_text.dart';

Widget Text_Animated_Row({
  required AddAccountCubit cubit
}){
  return Row(
    children: [
      SizedBox(
        width: 50.w,
      ),
      Text(
        "Add ",
        style: StyleManager.font30Bold,
      ),
      if(cubit.SelectedIndex==-1) DefaultTextStyle(
        style: StyleManager.font30Bold,
        child: animated_List(list:
        [
          RotateAnimatedText('Director'),
          RotateAnimatedText('Doctor'),
          RotateAnimatedText('Patient'),
          RotateAnimatedText('Reception'),
          RotateAnimatedText('lab-master'),
        ],),
      )
      else
        Text(
          "${cubit.Selected_role_list[cubit.SelectedIndex]["name"]} ",
          style: StyleManager.font30Bold,
        ),
    ],
  );
}
