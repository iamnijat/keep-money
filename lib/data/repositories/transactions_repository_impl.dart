import '../data_sources/local/preferences_data_source/preferences_data_source.dart';
import '../data_sources/remote/transactions_remote_data_source/transactions_remote_data_source.dart';

import '../../core/utils/either.dart';
import '../../core/error/failures.dart';
import '../../domain/repositories/transactions_repository.dart';

class TransactionsRepositoryImpl implements TransactionsRepository {
  final TransactionsRemoteDataSource remoteDataSource;
  final PreferencesDataSource preferencesDataSource;

  TransactionsRepositoryImpl({
    required this.remoteDataSource,
    required this.preferencesDataSource,
  });

  @override
  Future<Either<Failure, Unit>> createTransaction(String query,
      {Map<String, dynamic>? variables}) async {
    try {
      final userId = await preferencesDataSource.userId;

      Map<String, dynamic>? newVariables = variables;

      newVariables?['userId'] = userId;

      await remoteDataSource.createTransaction(query, variables: newVariables);

      return const Success(unit);
    } catch (_) {
      return const Error(Failure.other());
    }
  }

  @override
  Future<Either<Failure, Unit>> removeTransaction(String query,
      {Map<String, dynamic>? variables}) async {
    try {
      await remoteDataSource.removeTransaction(query, variables: variables);
      return const Success(unit);
    } catch (_) {
      return const Error(Failure.other());
    }
  }
}
