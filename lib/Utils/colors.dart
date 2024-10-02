import 'package:flutter/material.dart';

// Light Theme Colors
const Color kBackgroundColor = Color(0xFFF5E7DA);
const Color kBoxColor = Color(0xFFDABA94);
const Color kRedColor = Color(0xFFD90F2B);
const Color kBlackColor = Color(0xFF000000);
const Color kWhiteColor = Color(0xFFFFFFFF);
const Color kGrayColor = Color(0xFF9B9B9B);

// Dark Theme Colors
const Color darkBackgroundColor = Color(0xFF121212);
const Color darkBoxColor = Color(0xFF444444);
const Color darkRedColor = Color(0xFFD32F2F);
const Color darkBlackColor = Color(0xFFFFFFFF);
const Color darkWhiteColor = Color(0xFF1F1F1F);
const Color darkGrayColor = Color(0xFF757575);

// Light ThemeData
ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: kBackgroundColor,
  primaryColor: kBlackColor,
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: kBlackColor),
    bodyMedium: TextStyle(color: kBlackColor),
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: kBoxColor,
    iconTheme: IconThemeData(color: kBlackColor),
  ),
  colorScheme: const ColorScheme.light(
    primary: kBlackColor,
    surface: kBackgroundColor,
  ),
);

// Dark ThemeData
ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: darkBackgroundColor,
  primaryColor: kWhiteColor,
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: darkWhiteColor),
    bodyMedium: TextStyle(color: darkWhiteColor),
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: darkBoxColor,
    iconTheme: IconThemeData(color: darkWhiteColor),
  ),
  colorScheme: const ColorScheme.dark(
    primary: kWhiteColor,
    surface: darkBackgroundColor,
  ),
);
