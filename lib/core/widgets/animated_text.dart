import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/style_manager.dart';

Widget liquedText({
  required String text,
  required Color waveColor,
  required Color backgroundColor,
  double height = 140,
}) {
  return TextLiquidFill(
    loadDuration: const Duration(seconds: 4),
    text: text,
    waveColor: waveColor,
    boxBackgroundColor: backgroundColor,
    textStyle: StyleManager.font30Bold_Lobster,
    boxHeight: height.h,
  );
}

Widget animated_List({
  required List<RotateAnimatedText> list,
  int repeat_count=50,
  int microseconds_num=1
}){
  return AnimatedTextKit(
    totalRepeatCount: repeat_count,
    pause: Duration(microseconds: microseconds_num),
    animatedTexts: list,
  );
}
