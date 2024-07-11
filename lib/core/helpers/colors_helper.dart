import 'dart:ui';

import 'package:flutter/material.dart';

class ColorsHelper {
  static Color basicBackground = const Color.fromARGB(255, 247, 247, 248);

  ///teal
  static const Color tealLightest = Color(0xFFE0F7FA); // Lightest teal
  static const Color tealLighter = Color(0xFFB2EBF2); // Lighter teal
  static const Color tealLight = Color(0xFF80DEEA); // Light teal
  static const Color teal = Color(0xFF008080); // Teal
  static Color tealLightDark = Colors.teal.shade600;
  static const Color tealDark = Color(0xFF00796B); // Dark teal
  static const Color tealDarker = Color(0xFF004D40); // Darker teal
  static const Color tealDarkest = Color(0xFF00251A); // Darkest teal
// HexColor("#009797") hexteal
  //black
  static const Color black = Colors.black;
  //white
  static const Color white = Colors.white;

  ///gray
  static const Color lightGry = Color(0XFFD5D5D6);
  static const success = Color(0xff4AC064);
  static const error = Color(0xffFE6A60);
}
