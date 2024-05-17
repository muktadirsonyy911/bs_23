import 'dart:async';
import 'dart:io';
import 'package:bs_23/core/services/common_data_session_service.dart';
import 'package:bs_23/core/services/internet_connectivity_service.dart';
import 'package:bs_23/core/services/theme_service.dart';
import 'package:bs_23/core/utils/logcat.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class Initializer {
  const Initializer._internal();

  static const Initializer instance = Initializer._internal();

  factory Initializer() => instance;

  void init(VoidCallback runApp) {
    runZonedGuarded(() async {

      //To ensure that you can perform any necessary preparations before starting your app.
      WidgetsFlutterBinding.ensureInitialized();

      // To get rid of from handshake error
      HttpOverrides.global = MyHttpOverrides();

      FlutterError.onError = (details) {
        FlutterError.dumpErrorToConsole(details);
        Logcat.msg(details.stack.toString());
      };
      await _initServices();
      runApp();
    }, (error, stack) {
      Logcat.msg('runZonedGuarded: ${error.toString()}');
      Logcat.msg('stack: ${stack.toString()}');
    });
  }

  Future<void> _initServices() async {
    try {
      await _initStorage();
      _initScreenPreference();
      _initOthers();
    } catch (err) {
      rethrow;
    }
  }

  Future<void> _initStorage() async {
    await GetStorage.init();
  }

  void _initScreenPreference() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  void _initOthers()  async {
   Get.put(ThemeService());
   Get.put(InternetConnectivityService());
   await Get.putAsync<CommonDataSessionService>(() async => CommonDataSessionService());
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}
