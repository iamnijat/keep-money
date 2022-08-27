import '../../core/utils/either.dart';
import '../../core/error/failures.dart';

abstract class TransactionsRepository {
  Future<Either<Failure, Unit>> createTransaction(String query,
      {Map<String, dynamic>? variables});

  Future<Either<Failure, Unit>> removeTransaction(String query,
      {Map<String, dynamic>? variables});
}
