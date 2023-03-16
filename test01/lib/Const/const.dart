import 'package:flutter/material.dart';

class Constants{

  static String appName = "Project 01";

  static Color lightPrimary =  Color(0xfffcfcff);

  static Color darkPrimary = Colors.black;

  static Color lightAccent = Color(0xff5563ff);
  static Color darkAccent = Color(0xff5563ff);
  static Color lightBG = Color(0xfffcfcff);
  static Color darkBG = Colors.black;
  static Color? ratingBG = Colors.yellow[600];

  static ThemeData lightTheme = ThemeData(
    primaryColor: lightPrimary,
    appBarTheme: AppBarTheme(
      foregroundColor: darkAccent,
      titleTextStyle: TextStyle(
        fontSize: 20,
        color: darkPrimary,
        fontWeight: FontWeight.bold
      )

    ),
    textSelectionTheme:const TextSelectionThemeData(
      cursorColor: Colors.red,
      selectionColor: Colors.brown,
    ),

  );


  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,

    primaryColor: darkPrimary,

    scaffoldBackgroundColor: darkBG,

    appBarTheme: AppBarTheme(
      textTheme: TextTheme(
        headline6: TextStyle(
          color: lightBG,
          fontSize: 18.0,
          fontWeight: FontWeight.w800,
        ),
      ),
    ),
  );
}