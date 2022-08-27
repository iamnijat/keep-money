import '../data_sources/local/hive_local_data_source/hive_local_data_source.dart';

import '../../core/utils/either.dart';
import '../../core/error/failures.dart';
import '../../domain/repositories/hive_repository.dart';

class HiveRepositoryImpl implements HiveRepository {
  HiveRepositoryImpl(this._dataSource);

  final HiveLocalDataSource _dataSource;

  @override
  Future<Either<Failure, Unit>> init() async {
    try {
      await _dataSource.init();
      return const Success(unit);
    } catch (_) {
      return const Error(Failure.other());
    }
  }

  @override
  Either<Failure, Unit> close() {
    try {
      _dataSource.close();
      return const Success(unit);
    } catch (_) {
      return const Error(Failure.other());
    }
  }
}
