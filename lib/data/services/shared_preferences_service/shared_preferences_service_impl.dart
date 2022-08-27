part of shared_preferences_service;

class SharedPreferencesServiceImpl implements SharedPreferencesService {
  SharedPreferencesServiceImpl(this.preferences);

  final SharedPreferences preferences;

  /// Static Variables
  static const _userId = 'user_id';

  @override
  Future<String?> get userId async => preferences.getString(_userId);

  @override
  Future<void> setUserId(String value) async =>
      await preferences.setString(_userId, value);

  @override
  Future<void> clear() async => await preferences.clear();
}
