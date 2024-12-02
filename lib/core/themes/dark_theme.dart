import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

ThemeData darkTheme = ThemeData(
  primaryColor: AppColors.primaryColor,
  backgroundColor: Colors.black,
  textTheme: const TextTheme(
    bodyText1: TextStyle(color: AppColors.backgroundColor),
    bodyText2: TextStyle(color: AppColors.backgroundColor),
  ),
);
