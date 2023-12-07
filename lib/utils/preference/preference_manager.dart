abstract class PreferenceManager {
  Future<dynamic> readStore({required String key});
  Future<void> writeStore({required String key, required dynamic value});

  Future<void> remove(String key);
  Future<bool> clear();
}
