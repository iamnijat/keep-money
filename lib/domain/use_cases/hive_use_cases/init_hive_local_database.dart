import '../../repositories/hive_repository.dart';

import '../../../core/use_cases/use_case.dart';
import '../../../core/utils/either.dart';
import '../../../core/error/failures.dart';

class InitHiveLocalDatabase
    extends UseCase<Future<Either<Failure, Unit?>>, NoParams> {
  InitHiveLocalDatabase(this._repository);

  final HiveRepository _repository;

  @override
  Future<Either<Failure, Unit?>> call(NoParams params) async =>
      await _repository.init();
}
