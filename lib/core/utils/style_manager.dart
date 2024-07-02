import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StyleManager {
  ///texts
  static TextStyle fontRegular20 = const TextStyle(
      fontSize: 20, fontWeight: FontWeight.w400, color: Colors.white);

  static TextStyle font30Bold = TextStyle(
    fontSize: 30.sp,
    fontWeight: FontWeight.bold,
  );

  ///borders
  static RoundedRectangleBorder rounded50 = const RoundedRectangleBorder(
    borderRadius: BorderRadius.only(
      topRight: Radius.circular(50),
      bottomRight: Radius.circular(50),
    ),
  );
}
