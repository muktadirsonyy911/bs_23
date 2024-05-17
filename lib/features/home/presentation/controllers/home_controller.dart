import 'package:bs_23/core/local_storage/storage_helper.dart';
import 'package:bs_23/core/network/error/failures.dart';
import 'package:bs_23/core/styles/app_colors.dart';
import 'package:bs_23/features/home/data/data_sources/remote/home_remote_data_source_impl.dart';
import 'package:bs_23/features/home/data/repositories/home_repository_impl.dart';
import 'package:bs_23/features/home/domain/entities/git_repo_entity.dart';
import 'package:bs_23/features/home/domain/uses_cases/home_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final Rx<ThemeMode> selectedThemeMode = ThemeMode.light.obs;
  RxList<GitRepoEntity> gitRepoList = <GitRepoEntity>[].obs;
  RxBool gitRepoDataLoaded = false.obs;

  @override
  void onInit() {
    super.onInit();
    initThemeMode();
    _getGitRepo();
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
      SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        systemNavigationBarColor: AppColors.black, // navigation bar color
        statusBarColor: AppColors.black, // status bar color
      ));
    } else {
      SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        systemNavigationBarColor: AppColors.white, // navigation bar color
        statusBarColor: AppColors.white, // status bar color
      ));
    }
    StorageHelper.setTheme = themeMode.toString();
  }

  void _getGitRepo() async {
    HomeRepositoryImpl homeRepository = HomeRepositoryImpl(homeRemoteDataSource: HomeRemoteDataSourceImpl(dio: Dio()));
    final  Either<Failure, List<GitRepoEntity>> responseData = await HomeUseCase(homeRepository: homeRepository).call();

    responseData.fold((Failure l) {
      Get.rawSnackbar(message: l.errorMessage, backgroundColor: AppColors.red);
    }, ( List<GitRepoEntity> r) {
      gitRepoList.value = r;
    });
    gitRepoDataLoaded.value = true;
  }
}
