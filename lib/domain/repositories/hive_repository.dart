import '../../core/utils/either.dart';
import '../../core/error/failures.dart';

abstract class HiveRepository {
  Future<Either<Failure, Unit>> init();

  Either<Failure, Unit> close();
}
