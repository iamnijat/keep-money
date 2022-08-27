import '../../../core/use_cases/use_case.dart';
import '../../../core/utils/either.dart';
import '../../../core/error/failures.dart';
import '../../repositories/preferences_repository.dart';

class ClearSharedData
    extends UseCase<Future<Either<Failure, Unit?>>, NoParams> {
  ClearSharedData(this._repository);

  final PreferencesRepository _repository;

  @override
  Future<Either<Failure, Unit?>> call(NoParams params) => _repository.clear();
}
