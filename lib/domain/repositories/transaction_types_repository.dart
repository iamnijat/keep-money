import '../../core/utils/either.dart';
import '../../core/error/failures.dart';
import '../../data/models/hive_adapters/transaction_type_view_model/transaction_type_view_model.dart';

abstract class TransactionTypesRepository {
  Future<Either<Failure, List<TransactionTypeViewModel>?>>
      fetchTransactionTypes(String query, {Map<String, dynamic>? variables});
}
