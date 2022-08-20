import '../../data/models/view_model/user_view_model/user_view_model.dart';

import '../../core/utils/either.dart';
import '../../core/error/failures.dart';

abstract class UserRepository {
  Future<Either<Failure, UserViewModel?>> fetchUser(String query,
      {Map<String, dynamic>? variables});

  Future<Either<Failure, Unit>> updateUser(String query,
      {Map<String, dynamic>? variables});
}
