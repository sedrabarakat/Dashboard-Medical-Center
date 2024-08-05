import 'package:dashboad/core/helpers/colors_helper.dart';
import 'package:flutter/material.dart';

/* The Application Theme */
class ThemeManager {
  static final ThemeData lightTheme = ThemeData(
    primaryColor: ColorsHelper.blueDark, // Base blue color
   // accentColor: ColorsHelper.blueLight, // Accent color
    scaffoldBackgroundColor: Colors.white, // Background color
    appBarTheme: const AppBarTheme(
      color: ColorsHelper.blueDark,
      iconTheme: IconThemeData(color: Colors.white),
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: ColorsHelper.blue, // Base blue for buttons
      textTheme: ButtonTextTheme.primary,
    ),
    textTheme: const TextTheme(
      headlineSmall: TextStyle(
        color: ColorsHelper.blueDarkest,
        fontWeight: FontWeight.bold,
      ),
      bodyMedium: TextStyle(
        color: ColorsHelper.blueDark,

      ),
      headlineMedium: TextStyle(
        color: ColorsHelper.blueDarker,

      ),
    ),
    iconTheme: const IconThemeData(
      color: ColorsHelper.blueDark,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
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
            return ColorsHelper.blueLightest;
          }
          return Colors.white;
        }),
        todayBackgroundColor: MaterialStateColor.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return ColorsHelper.blueLightest;
          }
          return Colors.white;
        }),
        todayForegroundColor: MaterialStateColor.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return Colors.white;
          }
          return ColorsHelper.blue;
        }),
      ),
    timePickerTheme: TimePickerThemeData(
      backgroundColor: Colors.white, // Background color of the dialog
      hourMinuteTextColor: ColorsHelper.white, // Text color of the hour/minute
      hourMinuteColor: MaterialStateColor.resolveWith((states) =>
      states.contains(MaterialState.selected)
          ? ColorsHelper.blueLight // Color when selected
          : ColorsHelper.blueDark), // Color when not selected
      dayPeriodTextColor: MaterialStateColor.resolveWith((states) =>

           ColorsHelper.white // AM/PM text color when selected
      ), // AM/PM text color when not selected
      dayPeriodColor: MaterialStateColor.resolveWith((states) =>
      states.contains(MaterialState.selected)
          ? ColorsHelper.blueDark // AM/PM button color when selected
          : ColorsHelper.blueLightest), // AM/PM button color when not selected
      dialHandColor: ColorsHelper.blueDarker, // Dial hand color
      dialBackgroundColor: ColorsHelper.blueLightest, // Dial background color
      entryModeIconColor: ColorsHelper.blueDark, // Entry mode switch button color
      helpTextStyle: TextStyle(
        color: ColorsHelper.blueDark, // Help text style
        fontWeight: FontWeight.bold,
      ),
      hourMinuteTextStyle: TextStyle(
        color: ColorsHelper.blueDarkest, // Hour/minute text style
        fontSize: 40,
        fontWeight: FontWeight.bold,
      ),
      dayPeriodTextStyle: TextStyle(
        color: ColorsHelper.blueDark, // AM/PM text style
        fontWeight: FontWeight.bold,
      ),
      cancelButtonStyle: ButtonStyle(
        foregroundColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.pressed)) {
            return Colors.white; // Pressed color
          }
          return ColorsHelper.white; // Default color
        }),
        backgroundColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.pressed)) {
            return ColorsHelper.white; // Pressed color
          }
          return ColorsHelper.white; // Default color
        }),
      ),
      confirmButtonStyle: ButtonStyle(
        textStyle:MaterialStateProperty.resolveWith((states){
          if (states.contains(MaterialState.pressed)) {
            return const TextStyle(color: ColorsHelper.white);
          }
          return const TextStyle(color: ColorsHelper.blueDark);

        } ),
        foregroundColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.pressed)) {
            return ColorsHelper.blueDark;// Pressed color
          }
          return ColorsHelper.blueDark; // Default color
        }),
        backgroundColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.pressed)) {
            return ColorsHelper.blueLightest; // Pressed color
          }
          return ColorsHelper.white; // Default color
        }),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0), // Dialog shape
      ),
    ),
  );


}
