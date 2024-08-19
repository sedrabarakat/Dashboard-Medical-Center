import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/colors_helper.dart';
import '../../../../core/utils/style_manager.dart';
import '../../../../core/widgets/animated_text.dart';

Widget Inboxwidget(){
  return  Container(
      height: 130.h,width: 1600.w,
      decoration: StyleManager.rounded40(color: Colors.white),
      child: Padding(
        padding: EdgeInsets.only(left: 30.w),
        child: liquedText(
            text: 'Inbox',
            waveColor: ColorsHelper.primary,
            backgroundColor: Colors.white),
      )
  );
}