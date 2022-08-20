import '../../repositories/transactions_repository.dart';

import '../../../core/use_cases/use_case.dart';
import '../../../core/utils/either.dart';
import '../../../core/error/failures.dart';

import 'package:equatable/equatable.dart';

class RemoveTransation extends UseCase<Future<Either<Failure, Unit?>>, Params> {
  RemoveTransation(this._repository);

  final TransactionsRepository _repository;

  @override
  Future<Either<Failure, Unit?>> call(Params params) async {
    return await _repository.removeTransaction(params.query,
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
