import 'package:bs_23/core/styles/app_colors.dart';
import 'package:bs_23/core/styles/text_style.dart';
import 'package:bs_23/core/widgets/common_app_bar_widget.dart';
import 'package:bs_23/features/home/presentation/controllers/home_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBarWidget(title: "Home"),
      floatingActionButton: FloatingActionButton(
        child: const Icon(CupertinoIcons.sun_dust, color: AppColors.white),
          onPressed: () => controller.changeThemeMode(themeMode: Get.isDarkMode ? ThemeMode.light : ThemeMode.dark)),
      body:  Center(
        child: Text("HomeView", style: StyleText.size18Bold700)
      ),
    );
  }
}
