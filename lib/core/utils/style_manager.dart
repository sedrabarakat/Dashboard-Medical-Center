import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../helpers/colors_helper.dart';

class StyleManager {
  ///texts
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
  static TextStyle fontBold32 = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w700,
    color: ColorsHelper.black,
  );
  /*>>>>>>>>>> Medium <<<<<<<<<<*/
  static TextStyle fontMedium24 = TextStyle(
    fontSize: 24,
    color: ColorsHelper.black,
    fontWeight: FontWeight.w500,
  );
  static TextStyle fontMedium14 = const TextStyle(
    fontSize: 14,
    color: ColorsHelper.white,
    fontWeight: FontWeight.w500,
  );
  /*>>>>>>>>>> Regular <<<<<<<<<<*/
  static TextStyle fontRegular20 =  TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w400,
    color: Colors.white,
  );
  static TextStyle fontregular14 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: ColorsHelper.lightGry,
  );
  static TextStyle fontRegular16 = TextStyle(
    color: ColorsHelper.black,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );
  static TextStyle fontRegular12 = TextStyle(
    color: ColorsHelper.lightGry,
    fontSize: 12,
    fontWeight: FontWeight.w400,
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


