import '../../repositories/auth_repository.dart';

import '../../../core/use_cases/use_case.dart';
import '../../../core/utils/either.dart';
import '../../../core/error/failures.dart';

import 'package:equatable/equatable.dart';

class RegisterUser extends UseCase<Future<Either<Failure, String?>>, Params> {
  RegisterUser(this._repository);

  final AuthRepository _repository;

  @override
  Future<Either<Failure, String?>> call(Params params) async {
    return await _repository.register(params.query,
        variables: params.variables);
  }
}

class Params extends Equatable {
  final String query;
  final Map<String, dynamic>? variables;

  const Params({required this.query, this.variables});

  @override
  List<Object?> get props => [query, variables];
}
