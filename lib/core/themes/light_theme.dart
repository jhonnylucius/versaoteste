import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

ThemeData lightTheme = ThemeData(
  primaryColor: AppColors.primaryColor,
  backgroundColor: AppColors.backgroundColor,
  textTheme: const TextTheme(
    bodyText1: TextStyle(color: AppColors.textColor),
    bodyText2: TextStyle(color: AppColors.textColor),
  ),
);
