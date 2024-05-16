import 'package:bs_23/core/local_storage/storage_helper.dart';
import 'package:bs_23/core/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{

  final Rx<ThemeMode> selectedThemeMode = ThemeMode.light.obs;

  @override
  void onInit() {
    super.onInit();
    initThemeMode();
  }

  void initThemeMode() {
    switch (StorageHelper.getTheme) {
      case "ThemeMode.light":
        selectedThemeMode.value = ThemeMode.light;
        break;
      case "ThemeMode.dark":
        selectedThemeMode.value = ThemeMode.dark;
        break;
      default:
        selectedThemeMode.value = ThemeMode.light;
    }
  }

  void changeThemeMode({required ThemeMode themeMode}) {
    Get.changeThemeMode(themeMode);
    selectedThemeMode.value = themeMode;
    if (themeMode == ThemeMode.dark) {
      SystemChrome.setSystemUIOverlayStyle(
          const SystemUiOverlayStyle(
            systemNavigationBarColor: AppColors.black, // navigation bar color
            statusBarColor: AppColors.black, // status bar color
          )
      );
    } else {
      SystemChrome.setSystemUIOverlayStyle(
          const SystemUiOverlayStyle(
            systemNavigationBarColor: AppColors.white, // navigation bar color
            statusBarColor: AppColors.white, // status bar color
          )
      );
    }
    StorageHelper.setTheme = themeMode.toString();
  }
}