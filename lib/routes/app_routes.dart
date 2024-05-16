part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  static const String home = _Paths.home;
  static const String details = _Paths.details;
}

abstract class _Paths {
  _Paths._();

  static const String home = '/home';
  static const String details = '/details';
}
