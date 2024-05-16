import 'storage.dart';
part "storage_keyword.dart";

class StorageHelper {

  ///---Theme data
  static set setTheme(String themeMode) => Storage.saveValue(_StorageKeyword.themeData, themeMode);
  static String get getTheme => Storage.getValue(_StorageKeyword.themeData) ?? "ThemeMode.light";

}
