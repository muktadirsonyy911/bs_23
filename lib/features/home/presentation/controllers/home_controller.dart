import 'package:bs_23/core/local_storage/storage_helper.dart';
import 'package:bs_23/core/network/error/failures.dart';
import 'package:bs_23/core/services/internet_connection_service.dart';
import 'package:bs_23/core/styles/app_colors.dart';
import 'package:bs_23/core/utils/logcat.dart';
import 'package:bs_23/features/home/data/data_sources/local/ds_impl/git_repo_local_data_source_impl.dart';
import 'package:bs_23/features/home/data/data_sources/remote/home_remote_data_source_impl.dart';
import 'package:bs_23/features/home/data/repositories/home_repository_impl.dart';
import 'package:bs_23/features/home/domain/entities/git_repo_entity.dart';
import 'package:bs_23/features/home/domain/uses_cases/home_use_case.dart';
import 'package:bs_23/routes/app_pages.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  ///For Theme
  final Rx<ThemeMode> selectedThemeMode = ThemeMode.light.obs;

  ///For RepoList
  RxList<GitRepoEntity> gitRepoList = <GitRepoEntity>[].obs;
  RxBool gitRepoDataLoaded = false.obs;

  ///For Pagination
  final ScrollController scrollController = ScrollController();
  RxBool isLoading = false.obs;
  RxInt pageNo = 1.obs;

  late InternetConnectionService _internetConnectionService;

  @override
  void onInit() {
    super.onInit();
    _internetConnectionService = InternetConnectionService();
    initThemeMode();
    scrollController.addListener(_loadMoreData);
    fetchRepositories();
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

  Future<void> fetchRepositories() async {
    bool hasInternet = await _internetConnectionService.checkInternet();
    if (hasInternet == true) {
      _fetchRepos();
    } else {
      fetchReposFromLocal();
    }
  }

  Future<void> _loadMoreData() async {
    isLoading.value = true;
    if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
      pageNo.value = pageNo.value + 1;

      debugPrint('HomeController._loadMoreData:${pageNo.value}');

      HomeRepositoryImpl homeRepository = HomeRepositoryImpl(
          homeRemoteDataSource: HomeRemoteDataSourceImpl(dio: Dio()), homeLocalDatasource: HomeLocalDataSourceImpl());
      final Either<Failure, List<GitRepoEntity>> responseData =
          await HomeUseCase(homeRepository: homeRepository).getRepoFromRemote(page: pageNo.value);

      isLoading.value = false;
      responseData.fold((failure) {
        Logcat.msg(failure.errorMessage);
      }, (repos) {
        gitRepoList.addAll(repos);
      });
    }
  }

  Future<void> _fetchRepos() async {
    HomeRepositoryImpl homeRepository = HomeRepositoryImpl(
        homeRemoteDataSource: HomeRemoteDataSourceImpl(dio: Dio()), homeLocalDatasource: HomeLocalDataSourceImpl());
    final Either<Failure, List<GitRepoEntity>> responseData =
        await HomeUseCase(homeRepository: homeRepository).getRepoFromRemote(page: pageNo.value);

    responseData.fold((Failure failure) {
      Logcat.msg(failure.errorMessage);
    }, (repos) {
      gitRepoList.assignAll(repos);
    });
    gitRepoDataLoaded.value = true;
  }

  Future<void> fetchReposFromLocal() async {
    HomeRepositoryImpl homeRepository = HomeRepositoryImpl(
        homeRemoteDataSource: HomeRemoteDataSourceImpl(dio: Dio()), homeLocalDatasource: HomeLocalDataSourceImpl());
    final Either<Failure, List<GitRepoEntity>> responseData =
        await HomeUseCase(homeRepository: homeRepository).getRepoFromLocal();
    responseData.fold((failure) {
      Logcat.msg(failure.errorMessage);
    }, (repos) {
      gitRepoList.assignAll(repos);
    });
    gitRepoDataLoaded.value = true;
  }

  void onRepoTap({required GitRepoEntity gitRepo}) => Get.toNamed(Routes.details, arguments: gitRepo);
}
