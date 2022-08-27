import '../../../../core/error/exceptions.dart';
import '../../../models/hive_adapters/transaction_type_view_model/transaction_type_view_model.dart';
import '../../../services/hive_service/index.dart';
import 'transaction_types_local_data_source.dart';

class TransactionTypesLocalDataSourceImpl
    implements TransactionTypesLocalDataSource {
  TransactionTypesLocalDataSourceImpl(this._hive);

  final HiveService _hive;

  static const cachedTransactionTypes = 'CACHED_TRANSACTION_TYPES';

  @override
  Future<void> cacheTransactionTypes(
          List<TransactionTypeViewModel> value) async =>
      await _hive.cacheTransactionTypes(cachedTransactionTypes, value);

  @override
  dynamic fetchTransactionTypes() {
    if (isTransactionTypesCached(cachedTransactionTypes)) {
      return _hive.fetchCachedTransactionTypes(cachedTransactionTypes);
    } else {
      throw CacheException();
    }
  }

  @override
  bool isTransactionTypesCached(String key) =>
      _hive.isTransactionTypesCached(key);
}
