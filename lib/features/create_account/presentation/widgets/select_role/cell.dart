import 'package:dashboad/features/create_account/presentation/cubits/add_account_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helpers/colors_helper.dart';
import '../../../../../core/utils/style_manager.dart';

Widget Cell({required int index, required AddAccountCubit cubit}) {
  return Container(
    padding: EdgeInsets.all(3.w),
    height: 30.h,
    width: 20.w,
    decoration: StyleManager.Circle_Shape(color: ColorsHelper.black12),
    child: (index==cubit.SelectedIndex)?Container(
      height: 25.h,
      width: 15.w,
      decoration: StyleManager.Circle_Shape(color: ColorsHelper.tealDark),
    ):SizedBox(),
  );
}
