import 'package:flutter/material.dart';

class DimensionsHelper {
  static double screenHeight(BuildContext context) =>
      MediaQuery.sizeOf(context).height;
  static double screenWidth(BuildContext context) =>
      MediaQuery.sizeOf(context).width;
  static double heightPercentage(BuildContext context, double percentage) =>
      screenHeight(context) * percentage / 100;
  static double widthPercentage(BuildContext context, double percentage) =>
      screenWidth(context) * percentage / 100;
  static double fontSize(BuildContext context, double percentage) =>
      screenHeight(context) * percentage / 100;
  static double radius(BuildContext context, double percentage) =>
      screenHeight(context) * percentage / 100;
}
