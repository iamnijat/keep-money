import '../../core/error/failures.dart';
import '../../core/utils/either.dart';
import '../../domain/repositories/preferences_repository.dart';
import '../data_sources/local/preferences_data_source/preferences_data_source.dart';

class PreferencesRepositoryImpl implements PreferencesRepository {
  PreferencesRepositoryImpl(this._dataSource);

  final PreferencesDataSource _dataSource;

  @override
  Future<Either<Failure, Unit>> setUserId(String userId) async {
    try {
      await _dataSource.setUserId(userId);
      return const Success(unit);
    } catch (_) {
      return const Error(Failure.cache());
    }
  }

  @override
  Future<Either<Failure, String?>> get userId async {
    try {
      final userId = await _dataSource.userId;
      return Success(userId);
    } catch (_) {
      return const Error(Failure.cache());
    }
  }

  @override
  Future<Either<Failure, Unit>> clear() async {
    try {
      await _dataSource.clear();
      return const Success(unit);
    } catch (_) {
      return const Error(Failure.cache());
    }
  }
}
