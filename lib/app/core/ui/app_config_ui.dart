import 'package:flutter/material.dart';
import 'package:job_timer/app/core/ui/app_colors.dart';

class AppConfigUI {
  AppConfigUI._();

  static get _inputDecorationTheme => const InputDecorationTheme(
        border: OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.grey,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.grey,
          ),
        ),
        labelStyle: TextStyle(
          color: AppColors.black,
        ),
      );

  static get _elevatedButtonTheme => ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      );

  static final ThemeData theme = ThemeData(
    primarySwatch: AppColors.primarySwatch,
    primaryColor: AppColors.primaryColor,
    primaryColorLight: AppColors.primaryColorLight,
    inputDecorationTheme: _inputDecorationTheme,
    elevatedButtonTheme: _elevatedButtonTheme,
  );
}
