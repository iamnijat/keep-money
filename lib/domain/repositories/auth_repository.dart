import '../../core/utils/either.dart';
import '../../core/error/failures.dart';

abstract class AuthRepository {
  Future<Either<Failure, String>> register(String query,
      {Map<String, dynamic>? variables});
}
