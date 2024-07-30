import 'package:dashboad/core/helpers/colors_helper.dart';
import 'package:flutter/material.dart';

/* The Application Theme */
class ThemeManager {
  static final ThemeData lightTheme = ThemeData(
    primaryColor: ColorsHelper.blue, // Base blue color
   // accentColor: ColorsHelper.blueLight, // Accent color
    scaffoldBackgroundColor: Colors.white, // Background color
    appBarTheme: AppBarTheme(
      color: ColorsHelper.blueDark,
      iconTheme: IconThemeData(color: Colors.white),
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: ColorsHelper.blue, // Base blue for buttons
      textTheme: ButtonTextTheme.primary,
    ),
    textTheme: TextTheme(

      headlineSmall: TextStyle(
        color: ColorsHelper.blueDarkest,
        fontSize: 32,
        fontWeight: FontWeight.bold,
      ),
      bodyMedium: TextStyle(
        color: ColorsHelper.blueDark,
        fontSize: 16,
      ),
      headlineMedium: TextStyle(
        color: ColorsHelper.blueDarker,
        fontSize: 14,
      ),
    ),
    cardTheme: CardTheme(
      color: Colors.white,
      shadowColor: ColorsHelper.blueLightest,
      elevation: 4,
    ),
    iconTheme: IconThemeData(
      color: ColorsHelper.blue,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: ColorsHelper.blue,
    ),
      datePickerTheme: DatePickerThemeData(
        dayOverlayColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.pressed)) {
            return Colors.white; // Pressed color
          }
          return ColorsHelper.blue; // Default color
        }),
        confirmButtonStyle: ButtonStyle(
          foregroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed)) {
              return Colors.white; // Pressed color
            }
            return ColorsHelper.blue; // Default color
          }),
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed)) {
              return ColorsHelper.blue; // Pressed color
            }
            return ColorsHelper.blueLightest; // Default color
          }),
        ),
        cancelButtonStyle: ButtonStyle(
          foregroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed)) {
              return Colors.white; // Pressed color
            }
            return ColorsHelper.blue; // Default color
          }),
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed)) {
              return ColorsHelper.blueDarker; // Pressed color
            }
            return ColorsHelper.blueLightest; // Default color
          }),
        ),
        backgroundColor: Colors.white,
        // Background color of the date picker
        headerBackgroundColor: ColorsHelper.blueLightest,
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
          return ColorsHelper.blue;
        }),
      )
  );

}
