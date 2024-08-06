import 'package:flutter/material.dart';

final ThemeData customTheme = ThemeData(
  primarySwatch: Colors.blue,
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.blue.shade800,
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
    buttonColor: Colors.blue.shade600,
    textTheme: ButtonTextTheme.primary,
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
        color: Colors.blue.shade700,
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
      color: Colors.blue.shade700,
    ),
    titleSmall: TextStyle(
      color: Colors.blue.shade700,
    ),
  ),
);
