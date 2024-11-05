import "package:flutter/material.dart";
import "package:task_6_ecommerce/core/constant/app_colors.dart";

ThemeData appTheme = ThemeData(
    // canvasColor: AppColors.backgroundColor,
    // colorSchemeSeed: AppColors.backgroundColor,
    cardTheme: const CardTheme(color: AppColors.whiteColor),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.backgroundColor,
    ),
    cardColor: AppColors.whiteColor,
    appBarTheme: const AppBarTheme(
        centerTitle: true, backgroundColor: AppColors.backgroundColor),
    scaffoldBackgroundColor: AppColors.backgroundColor,
    bottomAppBarTheme: const BottomAppBarTheme(color: AppColors.whiteColor));
