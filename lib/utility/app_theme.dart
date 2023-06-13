import 'dart:ui';

import 'package:flutter/material.dart';

class AppTheme{
  AppTheme._();
  static final instance = AppTheme._();
  Color colorHeading =const Color(0xFF98A2AE);
  Color colorHeadingLight =const Color(0xFF9CADC1);
  Color colorWhite =const Color(0xFFFFFFFF);
  Color colorBlue =const Color(0xFF6bc6fa);
  Color colorDarkBlue =const Color(0xFF0052A8);
  Color colorArrow =const Color(0xFF264B75);
  Color colorLightBlue =const Color(0xFFDCEDFF);
  Color colorLightGreen =const Color(0xFF00DDA8);

  TextTheme getTextTheme =  const TextTheme(
    headlineLarge: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.black,
        decoration: TextDecoration.none),
    headlineMedium: TextStyle(
        color: Colors.grey,
        fontSize: 16,
        decoration: TextDecoration.none),
    headlineSmall: TextStyle(
        color: Colors.white,
        fontSize: 14,
        decoration: TextDecoration.none),
    titleLarge: TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.bold,
        decoration: TextDecoration.none),
    titleMedium: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.normal,
        decoration: TextDecoration.none),
    titleSmall: TextStyle(
        color: Colors.grey,
        fontSize: 14,
        fontWeight: FontWeight.normal,
        decoration: TextDecoration.none),
  );
}