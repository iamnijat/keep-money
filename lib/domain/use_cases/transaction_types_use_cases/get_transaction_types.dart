import 'package:equatable/equatable.dart';

import '../../../core/error/failures.dart';
import '../../../core/use_cases/use_case.dart';
import '../../../core/utils/either.dart';
import '../../../data/models/hive_adapters/transaction_type_view_model/transaction_type_view_model.dart';
import '../../repositories/transaction_types_repository.dart';

class GetTransactionTypes extends UseCase<
    Future<Either<Failure, List<TransactionTypeViewModel>?>>, Params> {
  GetTransactionTypes(this._repository);

  final TransactionTypesRepository _repository;

  @override
  Future<Either<Failure, List<TransactionTypeViewModel>?>> call(
      Params params) async {
    return await _repository.fetchTransactionTypes(params.query,
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
