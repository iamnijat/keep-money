import '../../core/utils/either.dart';
import '../../core/error/failures.dart';

abstract class PreferencesRepository {
  Future<Either<Failure, Unit>> setUserId(String userId);

  Future<Either<Failure, String?>> get userId;

  Future<Either<Failure, Unit>> clear();
}
