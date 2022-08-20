import '../../repositories/hive_repository.dart';

import '../../../core/use_cases/use_case.dart';
import '../../../core/utils/either.dart';
import '../../../core/error/failures.dart';

class CloseHiveLocalDatabase extends UseCase<Either<Failure, Unit?>, NoParams> {
  CloseHiveLocalDatabase(this._repository);

  final HiveRepository _repository;

  @override
  Either<Failure, Unit?> call(NoParams params) => _repository.close();
}
