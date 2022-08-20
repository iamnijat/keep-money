import '../../../models/view_model/user_view_model/user_view_model.dart';

abstract class UserLocalDataSource {
  Future<void> cacheUser(UserViewModel value);

  fetchCachedUser();

  bool isUserCached(String key);
}
