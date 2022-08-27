abstract class PreferencesDataSource {
  Future<String?> get userId;

  Future<void> setUserId(String value);

  Future<void> clear();
}
