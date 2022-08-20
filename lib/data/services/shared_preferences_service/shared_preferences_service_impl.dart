part of shared_preferences_service;

class SharedPreferencesServiceImpl implements SharedPreferencesService {
  late SharedPreferences _sp;

  /// Static Variables
  static const _userId = 'user_id';

  @override
  Future<SharedPreferences?> init() async {
    _sp = await SharedPreferences.getInstance();
    return _sp;
  }

  @override
  Future<String?> get userId async {
    final shared = await init();
    return shared?.getString(_userId);
  }

  @override
  Future<void> setUserId(String value) async {
    final shared = await init();
    await shared?.setString(_userId, value);
  }

  @override
  Future<void> clear() async {
    final shared = await init();
    await shared?.clear();
  }
}
