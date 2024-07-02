import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../helpers/colors_helper.dart';
import '../utils/style_manager.dart';

Widget Liqued_Text({
  required String Text,
  required Color waveColor,
  required Color BackgroundColor,
  double height=140,
}){
  return TextLiquidFill(
    text: Text,
    waveColor: waveColor,
    boxBackgroundColor: BackgroundColor,
    textStyle: StyleManager.font30Bold,
    boxHeight: height.h,
  );
}