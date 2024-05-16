import 'package:get_storage/get_storage.dart';

class Storage {
  const Storage._();

  static final GetStorage _storage = GetStorage();

  ///Create a specific data
  static Future<void> saveValue(String key, dynamic value) async {
    await _storage.write(key, value);
    await _storage.save();
  }

  ///Read a specific data
  static T? getValue<T>(String key) => _storage.read<T>(key);

  ///Search a specific data
  static bool hasData(String key) => _storage.hasData(key);

  ///Delete a specific data
  static Future<void> removeValue(String key) => _storage.remove(key);

  ///Clear DB
  static Future<void> clearStorage() => _storage.erase();
}
