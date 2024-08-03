import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/style_manager.dart';

Widget TextsCol({required List<String> texts}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: texts
        .map((item) => Padding(
        padding: EdgeInsets.only(bottom: 5.h),
        child: Padding(
          padding: EdgeInsets.only(top: (item=="Description")?40.h:22.h, bottom: 10.h),
          child: Text("$item : ", style: StyleManager.font20Bold),
        )))
        .toList(),
  );
}