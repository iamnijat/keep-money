import '../../../models/hive_adapters/transaction_type_view_model/transaction_type_view_model.dart';

abstract class TransactionTypesLocalDataSource {
  Future<void> cacheTransactionTypes(List<TransactionTypeViewModel> value);

  dynamic fetchTransactionTypes();

  bool isTransactionTypesCached(String key);
}
