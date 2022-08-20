import '../../../models/view_model/transaction_type_view_model/transaction_type_view_model.dart';

abstract class TransactionTypesLocalDataSource {
  Future<void> cacheTransactionTypes(List<TransactionTypeViewModel> value);

  fetchTransactionTypes();

  bool isTransactionTypesCached(String key);
}
