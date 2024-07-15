import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StyleManager {
  ///texts
  static TextStyle fontRegular20 = const TextStyle(
      fontSize: 20, fontWeight: FontWeight.w400, color: Colors.white);

  static TextStyle font30Bold = TextStyle(
    color: Colors.teal,
    fontSize: 30.sp,
    fontWeight: FontWeight.bold,
  );

  static TextStyle font20W600 = TextStyle(
      fontSize: 20.sp, color: Colors.black54,
      fontWeight: FontWeight.w600
  );

  static TextStyle font30Bold_Lobster = TextStyle(
      fontSize: 30.sp,
      fontWeight: FontWeight.bold,
      fontFamily: "Lobster-Regular"
  );

  ///borders
  static RoundedRectangleBorder rounded50 = const RoundedRectangleBorder(
    borderRadius: BorderRadius.only(
      topRight: Radius.circular(50),
      bottomRight: Radius.circular(50),
    ),
  );


  ///shapes BoxDecoration
  static BoxDecoration Circle_Shape({
    required Color color
  }) {
    return BoxDecoration(
      shape: BoxShape.circle,
      color: color,
    );
  }

  static BoxDecoration rounded40({
    required Color color
  }) {
    return BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(40)
      );
  }


}


