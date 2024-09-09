// ignore_for_file: deprecated_member_use

import 'package:bayti/source/core/values/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:bayti/source/core/values/app_colors.dart';
import 'package:bayti/source/core/storage/app_storage.dart';
import 'package:bayti/source/core/values/app_dimensions.dart';

abstract class AppThemes {
  ///region Themes & Fonts Keys
  static const String appFontFamily = "Sora";
  static const String theme01 = "theme01";
  static const String theme02 = "theme02";

  ///endregion Themes & Fonts Keys

  static final ThemeData _lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: AppColors.primary,
    cardColor: AppColors.primaryContainer,
    focusColor: AppColors.secondary,
    canvasColor: AppColors.secondaryContainer,
    hoverColor: AppColors.errorContainer,
    scaffoldBackgroundColor: AppColors.whiteBlue,
    shadowColor: AppColors.shadow,
    textTheme: TextTheme(
      titleSmall: TextStyle(
        color: AppColors.onPrimaryContainer.withOpacity(
          AppConstants.opacity_06,
        ),
        fontSize: AppDimensions.fontSize08.sp,
        fontWeight: FontWeight.w400,
        fontFamily: AppThemes.appFontFamily,
      ),
      titleMedium: TextStyle(
        color: AppColors.onPrimary,
        fontSize: AppDimensions.fontSize12.sp,
        fontWeight: FontWeight.bold,
        fontFamily: AppThemes.appFontFamily,
      ),
      titleLarge: TextStyle(
        color: AppColors.onPrimary,
        fontSize: AppDimensions.fontSize14.sp,
        fontWeight: FontWeight.bold,
        fontFamily: AppThemes.appFontFamily,
      ),
      displaySmall: TextStyle(
        color: AppColors.onPrimaryContainer,
        fontSize: AppDimensions.fontSize09.sp,
        fontWeight: FontWeight.w400,
        fontFamily: AppThemes.appFontFamily,
      ),
      displayMedium: TextStyle(
        color: AppColors.primary,
        fontSize: AppDimensions.fontSize08.sp,
        fontWeight: FontWeight.w600,
        fontFamily: AppThemes.appFontFamily,
      ),
      displayLarge: TextStyle(
        color: AppColors.onBackground,
        fontSize: AppDimensions.fontSize08.sp,
        fontWeight: FontWeight.w400,
        fontFamily: AppThemes.appFontFamily,
        height: AppDimensions.height02,
      ),
      bodySmall: TextStyle(
        color: AppColors.onBackground,
        fontSize: AppDimensions.fontSize08.sp,
        fontWeight: FontWeight.w400,
        fontFamily: AppThemes.appFontFamily,
      ),
      bodyMedium: TextStyle(
        color: AppColors.outline,
        fontSize: AppDimensions.fontSize08.sp,
        fontWeight: FontWeight.w400,
        fontFamily: AppThemes.appFontFamily,
      ),
      bodyLarge: TextStyle(
        color: AppColors.primary,
        fontSize: AppDimensions.fontSize12.sp,
        fontWeight: FontWeight.w600,
        fontFamily: AppThemes.appFontFamily,
      ),
      headlineLarge: TextStyle(
        color: AppColors.onPrimary,
        fontSize: AppDimensions.fontSize08.sp,
        fontWeight: FontWeight.bold,
        fontFamily: AppThemes.appFontFamily,
      ),
      headlineMedium: TextStyle(
        color: AppColors.primary,
        fontSize: AppDimensions.fontSize09.sp,
        fontWeight: FontWeight.w400,
        fontFamily: AppThemes.appFontFamily,
        height: AppDimensions.height02,
      ),
      //
    ),
  );

  static final ThemeData _darkTheme = ThemeData();

  /// Keys [theme01, theme02]
  static void changeTheme({
    required String theme,
    required bool isDarkMode,
  }) async {
    await AppStorage.write(
      AppStorage.theme,
      theme,
    );

    await AppStorage.write(
      AppStorage.isDarkMode,
      isDarkMode,
    );

    final ThemeData themeData = _getThemeData(
      theme: theme,
      isDarkMode: isDarkMode,
    );

    Get.changeTheme(
      themeData,
    );

    Get.changeThemeMode(
      getAppThemeMode(),
    );
  }

  static ThemeData getAppTheme() {
    final theme = AppStorage.read<String>(
      AppStorage.theme,
      theme01,
    );

    return _getThemeData(
      theme: theme,
      isDarkMode: false,
    );
  }

  static ThemeData getAppDarkTheme() {
    final theme = AppStorage.read<String>(
      AppStorage.theme,
      theme02,
    );

    return _getThemeData(
      theme: theme,
      isDarkMode: true,
    );
  }

  static ThemeMode getAppThemeMode() {
    final isDarkMode = AppStorage.read<bool>(
      AppStorage.isDarkMode,
      false,
    );

    return isDarkMode ? ThemeMode.dark : ThemeMode.light;
  }

  static ThemeData _getThemeData({
    required String theme,
    required bool isDarkMode,
  }) {
    final ThemeData themeData;

    if (isDarkMode) {
      themeData = _darkTheme;
    } else {
      themeData = _lightTheme;
    }

    return themeData;
  }
}
