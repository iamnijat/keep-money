import '../../../models/hive_adapters/user_view_model/user_view_model.dart';

import '../../../../core/error/exceptions.dart';
import '../../../services/hive_service/index.dart';
import 'user_local_data_source.dart';

class UserLocalDataSourceImpl implements UserLocalDataSource {
  UserLocalDataSourceImpl(this._hive);

  final HiveService _hive;

  static const cachedUser = 'CACHED_USER';

  @override
  Future<void> cacheUser(UserViewModel value) async =>
      await _hive.cacheUser(cachedUser, value);

  @override
  fetchCachedUser() {
    if (isUserCached(cachedUser)) {
      return _hive.fetchCachedUser(cachedUser);
    } else {
      throw CacheException();
    }
  }

  @override
  bool isUserCached(String key) => _hive.isUserCached(cachedUser);
}
