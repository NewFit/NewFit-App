import 'package:get_storage/get_storage.dart';

mixin StorageUtil {
  final _storage = GetStorage();

  Future<void> saveString(String key, String uid) async {
    await _storage.write(key, uid);
  }

  Future<void> saveInt(String key, int uid) async {
    await _storage.write(key, uid);
  }

  String? getString(String key) {
    return _storage.read(key);
  }

  int? getInt(String key) {
    return _storage.read(key);
  }
}
