import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../helpers/colors_helper.dart';

class StyleManager {
  ///texts
  static TextStyle font30Bold = TextStyle(
    color: ColorsHelper.blue,
    fontSize: 30.sp,
    fontWeight: FontWeight.bold,
  );
  static TextStyle font35Bold = TextStyle(
    color: ColorsHelper.blueDark,
    fontSize: 35.sp,
    fontWeight: FontWeight.bold,
  );
  static TextStyle font20Bold = TextStyle(
    color: ColorsHelper.blueDark,
    fontSize: 20.sp,
    fontWeight: FontWeight.bold,
  );

  static TextStyle font20W600 = TextStyle(
      fontSize: 20.sp, color: Colors.black54, fontWeight: FontWeight.w600);

  static TextStyle font30Bold_Lobster = TextStyle(
    fontSize: 30.sp,
    fontWeight: FontWeight.bold,
    fontFamily: "Lobster-Regular",
  );
  /*>>>>>>>>>> Bold <<<<<<<<<<*/
  static TextStyle fontBold32 = TextStyle(
    fontSize: 32.sp,
    fontWeight: FontWeight.w700,
    color: ColorsHelper.black,
  );
  /*>>>>>>>>>> Semi-Bold <<<<<<<<<<*/
  static TextStyle fontSemiBold22 = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w600,
    color: ColorsHelper.black,
  );
  static TextStyle fontSemiBold18 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: ColorsHelper.black,
  );
  static TextStyle fontSemiBold12 = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: ColorsHelper.black,
  );
  /*>>>>>>>>>> Medium <<<<<<<<<<*/
  static TextStyle fontMedium30Black = TextStyle(
    fontSize: 30.sp,
    //fontWeight: FontWeight.w500,
    color: ColorsHelper.black,
  );
  static TextStyle fontMedium30Dark = TextStyle(
    fontSize: 30.sp,
    //fontWeight: FontWeight.w500,
    color: ColorsHelper.blueDark,
  );
  static TextStyle fontMedium24 = TextStyle(
    fontSize: 24.sp,
    color: ColorsHelper.black,
    fontWeight: FontWeight.w500,
  );
  static TextStyle fontMedium14 =  TextStyle(
    fontSize: 14.sp,
    color: ColorsHelper.white,
    fontWeight: FontWeight.w500,
  );
  /*>>>>>>>>>> Regular <<<<<<<<<<*/
  static TextStyle fontRegular20 =  TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.w400,
    color: Colors.white,
  );
  static TextStyle fontregular14 =  TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: ColorsHelper.lightGry,
  );
  static TextStyle fontRegular16 = TextStyle(
    color: ColorsHelper.black,
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
  );
  static TextStyle fontRegular12 =  TextStyle(
    color: ColorsHelper.lightGry,
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
  );

  ///borders
  static RoundedRectangleBorder rounded50 = const RoundedRectangleBorder(
    borderRadius: BorderRadius.only(
      topRight: Radius.circular(50),
      bottomRight: Radius.circular(50),
    ),
  );

  ///Input Borders
  static InputBorder Border_round40 = OutlineInputBorder(
    borderRadius: BorderRadius.circular(40),
    borderSide: BorderSide(
      color: Colors.grey.shade300,
    ),
  );

  static InputBorder FieldBorder_round40 = OutlineInputBorder(
    borderRadius: BorderRadius.circular(40),
    borderSide: BorderSide.none,
  );
  static InputBorder Border_round40Blue = OutlineInputBorder(
    borderRadius: BorderRadius.circular(40),
    borderSide: BorderSide(
      color: ColorsHelper.blueDark,
      width: 1.5.w
    ),
  );




  ///shapes BoxDecoration
  static BoxDecoration Circle_Shape({required Color color}) {
    return BoxDecoration(
      shape: BoxShape.circle,
      color: color,

    );
  }

  static BoxDecoration rounded40({required Color color}) {
    return BoxDecoration(color: color, borderRadius: BorderRadius.circular(40));
  }
}
