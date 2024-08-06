import 'package:flutter/material.dart';

final ThemeData customTheme = ThemeData(
  primarySwatch: Colors.green,
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.green.shade800,
    foregroundColor: Colors.white,
    elevation: 4.0,
    centerTitle: true,
    iconTheme: const IconThemeData(color: Colors.white),
    actionsIconTheme: const IconThemeData(color: Colors.white),
    titleTextStyle: const TextStyle(
      color: Colors.white,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    ),
    toolbarTextStyle: const TextStyle(
      color: Colors.white,
      fontSize: 18.0,
    ),
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: Colors.green.shade600,
    textTheme: ButtonTextTheme.primary,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.green,
      // Background color
      foregroundColor: Colors.white,
      // Text color
      elevation: 8,
      // Elevation
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.0),
      borderSide: BorderSide(
        color: Colors.grey.shade400,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.0),
      borderSide: BorderSide(
        color: Colors.grey.shade400,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.0),
      borderSide: BorderSide(
        color: Colors.green.shade700,
      ),
    ),
    labelStyle: TextStyle(
      color: Colors.grey.shade700,
    ),
    hintStyle: TextStyle(
      color: Colors.grey.shade500,
    ),
    prefixIconColor: Colors.grey.shade600,
  ),
  textTheme: TextTheme(
    bodyLarge: TextStyle(
      color: Colors.grey.shade800,
    ),
    bodyMedium: TextStyle(
      color: Colors.grey.shade800,
    ),
    titleMedium: TextStyle(
      color: Colors.green.shade700,
    ),
    titleSmall: TextStyle(
      color: Colors.green.shade700,
    ),
  ),
  snackBarTheme: SnackBarThemeData(
    backgroundColor: Colors.green.shade800,
    contentTextStyle: const TextStyle(
      color: Colors.white,
      fontSize: 16.0,
    ),
    actionTextColor: Colors.green.shade200,
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0),
    ),
  ),
);
