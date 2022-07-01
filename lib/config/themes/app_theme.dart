import 'package:flutter/material.dart';
import '../../core/utils/app_strings.dart';

import '../../core/utils/app_colors.dart';

ThemeData appTheme() {
  return ThemeData(
    primaryColor: AppColors.primary,
    hintColor: AppColors.hint,
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: Colors.transparent,
      elevation: 0,
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    fontFamily: AppStrings.fontFamily,
    textTheme: TextTheme(
      bodyMedium: TextStyle(
        height: 1.3,
        fontSize: 22,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
      
    ),
  );
}
