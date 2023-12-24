import 'package:get_storage/get_storage.dart';

class StorageUtil {
  static Future<void> saveString(String key, String uid) async {
    await GetStorage().write(key, uid);
  }

  static Future<void> saveInt(String key, int uid) async {
    await GetStorage().write(key, uid);
  }

  static String? getString(String key) {
    return GetStorage().read(key);
  }

  static int? getInt(String key) {
    return GetStorage().read(key);
  }
}
