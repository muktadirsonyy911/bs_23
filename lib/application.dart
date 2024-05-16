import 'package:bs_23/core/services/theme_service.dart';
import 'package:bs_23/core/utils/constants/app_constants.dart';
import 'package:bs_23/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Application extends StatelessWidget {
  const Application({super.key});
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppConstants.appName,
      themeMode: Get.find<ThemeService>().getThemeMode(),
      theme: Get.find<ThemeService>().getLightTheme(),
      darkTheme: Get.find<ThemeService>().getDarkTheme(),
      initialRoute: Routes.home,
      getPages: AppPages.routes,
    );
  }
}