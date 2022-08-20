part of shared_preferences_service;

abstract class SharedPreferencesService {
  Future<SharedPreferences?> init();

  Future<String?> get userId;

  Future<void> setUserId(String value);

  Future<void> clear();
}
