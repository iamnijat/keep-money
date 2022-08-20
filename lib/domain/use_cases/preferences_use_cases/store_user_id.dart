import '../../../core/use_cases/use_case.dart';
import '../../../core/utils/either.dart';
import '../../../core/error/failures.dart';
import '../../repositories/preferences_repository.dart';

class StoreUserId extends UseCase<Future<Either<Failure, Unit?>>, String> {
  StoreUserId(this._repository);

  final PreferencesRepository _repository;

  @override
  Future<Either<Failure, Unit?>> call(String params) =>
      _repository.setUserId(params);
}
