import 'package:equatable/equatable.dart';

import '../../../core/error/failures.dart';
import '../../../core/use_cases/use_case.dart';
import '../../../core/utils/either.dart';
import '../../../data/models/hive_adapters/user_view_model/user_view_model.dart';
import '../../repositories/user_repository.dart';

class GetUser
    extends UseCase<Future<Either<Failure, UserViewModel?>>, GetUserParams> {
  GetUser(this._repository);

  final UserRepository _repository;

  @override
  Future<Either<Failure, UserViewModel?>> call(GetUserParams params) async {
    return await _repository.fetchUser(params.query,
        variables: params.variables);
  }
}

class GetUserParams extends Equatable {
  final String query;
  final Map<String, dynamic>? variables;

  const GetUserParams({required this.query, this.variables});

  @override
  List<Object?> get props => [query, variables];
}
