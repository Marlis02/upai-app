import 'package:ctmax_upai/styles/colors_style.dart';
import 'package:flutter/material.dart';

final defaultTheme = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  splashColor: const Color.fromARGB(255, 191, 215, 236),
  hoverColor: AppColors.primary.withOpacity(0.1),
  primaryColor: AppColors.primary,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor:  const WidgetStatePropertyAll(AppColors.white),
      overlayColor: WidgetStatePropertyAll(AppColors.primary.withOpacity(0.1)),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: ButtonStyle(
      overlayColor: WidgetStatePropertyAll(AppColors.primary.withOpacity(0.1)),
    )
  ),
  textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        overlayColor: WidgetStatePropertyAll(AppColors.primary.withOpacity(0.1)),
      )
  )
);
