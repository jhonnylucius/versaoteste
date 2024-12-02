import 'package:flutter/material.dart';
import 'package:versaoteste/core/constants/app_colors.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: AppColors.primaryColor,
  accentColor: AppColors.secondaryColor,
  scaffoldBackgroundColor: AppColors.backgroundColor,
  textTheme: TextTheme(
    headline1: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: AppColors.textColor,
    ),
    bodyText1: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      color: AppColors.textColor,
    ),
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: AppColors.primaryColor,
    textTheme: ButtonTextTheme.primary,
  ),
);
