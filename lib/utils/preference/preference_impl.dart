import 'package:get_storage/get_storage.dart';
import 'preference_manager.dart';

class PreferenceImpl implements PreferenceManager {
  static const keyTheme = "theme";
  static const sessionId = "sessionId";
  static const roles = "roles";

  final _storage = GetStorage();

  @override
  Future<dynamic> readStore({required String key}) async {
    return _storage.read(key);
  }

  @override
  Future<void> writeStore({required String key, required value}) async {
    await _storage.write(key, value);
  }

  @override
  Future<bool> clear() {
    // TODO: implement clear
    throw UnimplementedError();
  }

  @override
  Future<void> remove(String key) async {
    await _storage.remove(key);
  }
}
