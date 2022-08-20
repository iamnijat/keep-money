import '../../../services/shared_preferences_service/index.dart';
import 'preferences_data_source.dart';

class PreferencesDataSourceImpl implements PreferencesDataSource {
  PreferencesDataSourceImpl(this._preferences);

  final SharedPreferencesService _preferences;

  @override
  Future<void> setUserId(String value) async =>
      await _preferences.setUserId(value);

  @override
  Future<String?> get userId async => await _preferences.userId;

  @override
  Future<void> clear() async => await _preferences.clear();
}
