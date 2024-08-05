import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../helpers/colors_helper.dart';

Widget editingInfoButtons({
  required cubit,
}){
  return Expanded(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        CircleAvatar(
            backgroundColor: ColorsHelper.blueLightest.withOpacity(.3),
            child: IconButton(onPressed: cubit.editingToggle,
                icon: const Icon(Icons.edit,))),
        SizedBox(width: 10.w,),
        (cubit.isEditing)?CircleAvatar(
            backgroundColor: ColorsHelper.blueLightest.withOpacity(.3),
            child: IconButton(onPressed:cubit.updateProfile,
                icon: const Icon(Icons.check, ))):SizedBox(),
        SizedBox(width: 10.w,),
        (cubit.isEditing)?CircleAvatar(
            backgroundColor: ColorsHelper.blueLightest.withOpacity(.3),
            child: IconButton(onPressed: cubit.cancelEditing,
                icon: const Icon(Icons.cancel_outlined, ))):SizedBox(),
      ],
    ),
  );
}