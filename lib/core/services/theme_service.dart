import 'package:bs_23/core/local_storage/storage_helper.dart';
import 'package:bs_23/core/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ThemeService extends GetxService {
  ThemeData getLightTheme() {
    // TODO change font dynamically
    return ThemeData(
      fontFamily: 'Georgia',
      primaryColor: AppColors.primaryColor,
      floatingActionButtonTheme: const FloatingActionButtonThemeData(elevation: 0, foregroundColor: AppColors.black),
      scaffoldBackgroundColor: AppColors.white,
      brightness: Brightness.light,
      hintColor: AppColors.grey,
      canvasColor: AppColors.white,
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(foregroundColor: AppColors.black),
      ),
      colorScheme: const ColorScheme.light(primary: AppColors.black, secondary: AppColors.black),
    );
  }

  ThemeData getDarkTheme() {
    // TODO change font dynamically
    return ThemeData(
      fontFamily: 'Georgia',
      primaryColor: AppColors.primaryColor,
      floatingActionButtonTheme: const FloatingActionButtonThemeData(elevation: 0, foregroundColor: AppColors.black),
      scaffoldBackgroundColor: AppColors.black,
      brightness: Brightness.dark,
      dividerColor: AppColors.grey,
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.black,
        ),
      ),
      colorScheme: const ColorScheme.dark(
        primary: AppColors.black,
        secondary: AppColors.grey,
      ),
    );
  }

  ThemeMode getThemeMode() {
    switch (StorageHelper.getTheme) {
      case "ThemeMode.light":
        SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
          systemNavigationBarColor: AppColors.white, // navigation bar color
          statusBarColor: AppColors.white, // status bar color
        ));
        return ThemeMode.light;
      case "ThemeMode.dark":
        SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
          systemNavigationBarColor: AppColors.black, // navigation bar color
          statusBarColor: AppColors.black, // status bar color
        ));
        return ThemeMode.dark;
      default:
        SystemChrome.setSystemUIOverlayStyle(
          SystemUiOverlayStyle.light
              .copyWith(systemNavigationBarColor: AppColors.white, statusBarColor: AppColors.white),
        );
        return ThemeMode.light;
    }
  }
}