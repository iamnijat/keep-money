import '../../core/error/failures.dart';
import '../../core/utils/either.dart';
import '../../data/models/hive_adapters/user_view_model/user_view_model.dart';

abstract class UserRepository {
  Future<Either<Failure, UserViewModel?>> fetchUser(String query,
      {Map<String, dynamic>? variables});

  Future<Either<Failure, Unit>> updateUser(String query,
      {Map<String, dynamic>? variables});
}
