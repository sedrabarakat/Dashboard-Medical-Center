import 'package:dashboad/core/helpers/colors_helper.dart';
import 'package:flutter/material.dart';

/* The Application Theme */
class ThemeManager {
  static ThemeData myTheme = ThemeData(
      datePickerTheme: DatePickerThemeData(
    dayOverlayColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.pressed)) {
        return Colors.white; // Pressed color
      }
      return ColorsHelper.teal; // Default color
    }),
    confirmButtonStyle: ButtonStyle(
      foregroundColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.pressed)) {
          return Colors.white; // Pressed color
        }
        return ColorsHelper.teal; // Default color
      }),
      backgroundColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.pressed)) {
          return ColorsHelper.teal; // Pressed color
        }
        return ColorsHelper.tealLightest; // Default color
      }),
    ),
    cancelButtonStyle: ButtonStyle(
      foregroundColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.pressed)) {
          return Colors.white; // Pressed color
        }
        return ColorsHelper.teal; // Default color
      }),
      backgroundColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.pressed)) {
          return ColorsHelper.tealDarker; // Pressed color
        }
        return ColorsHelper.tealLightest; // Default color
      }),
    ),
    backgroundColor: Colors.white,
    // Background color of the date picker
    headerBackgroundColor: ColorsHelper.tealLightest,
    // Background color of the header
    dayForegroundColor: MaterialStateColor.resolveWith((states) {
      if (states.contains(MaterialState.selected)) {
        return Colors.white;
      }
      return Colors.black;
    }),
    dayBackgroundColor: MaterialStateColor.resolveWith((states) {
      if (states.contains(MaterialState.selected)) {
        return Colors.teal;
      }
      return Colors.white;
    }),
        todayBackgroundColor: MaterialStateColor.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return Colors.teal;
          }
          return Colors.white;
        }),
        todayForegroundColor: MaterialStateColor.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return Colors.white;
          }
          return ColorsHelper.teal;
        }),
  ));
}
