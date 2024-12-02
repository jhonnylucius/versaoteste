import 'package:flutter/material.dart';
import 'package:versaoteste/core/constants/app_colors.dart';

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: AppColors.primaryColor,
  accentColor: AppColors.secondaryColor,
  scaffoldBackgroundColor: Colors.black,
  textTheme: TextTheme(
    headline1: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: AppColors.backgroundColor,
    ),
    bodyText1: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      color: AppColors.backgroundColor,
    ),
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: AppColors.secondaryColor,
    textTheme: ButtonTextTheme.primary,
  ),
);
