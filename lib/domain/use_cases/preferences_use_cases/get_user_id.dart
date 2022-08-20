import '../../../core/use_cases/use_case.dart';
import '../../../core/utils/either.dart';
import '../../../core/error/failures.dart';
import '../../repositories/preferences_repository.dart';

class GetUserId extends UseCase<Future<Either<Failure, String?>>, NoParams> {
  GetUserId(this._repository);

  final PreferencesRepository _repository;

  @override
  Future<Either<Failure, String?>> call(NoParams params) => _repository.userId;
}
