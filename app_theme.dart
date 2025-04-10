import 'package:flutter/material.dart';

class MyAppTheme {
  MyAppTheme._(); // Private Constructor

  static const Color PRIMARY_COLOR = Colors.blue;

  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: PRIMARY_COLOR,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
        backgroundColor: WidgetStateProperty.all<Color>(PRIMARY_COLOR),
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: PRIMARY_COLOR,
      foregroundColor: Colors.white,
    ),
    textTheme: TextTheme(
      headlineMedium: TextStyle(
          fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(),
      fillColor: Colors.grey[200],
      filled: true,
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        foregroundColor: WidgetStateProperty.all<Color>(Colors.black),
        backgroundColor: WidgetStateProperty.all<Color>(Colors.grey[800]!),
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,
    ),
    textTheme: TextTheme(
      headlineMedium: TextStyle(
          fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(),
      fillColor: Colors.grey[700],
      filled: true,
    ),
  );
}
