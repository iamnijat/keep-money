part of hive_service;

abstract class HiveService {
  Future<void> init();

  void close();

  /// UserBox
  Future<void> cacheUser(String key, UserViewModel value);

  fetchCachedUser(String key);

  bool isUserCached(String key);

  /// TransactionTypesBox
  Future<void> cacheTransactionTypes(
      String key, List<TransactionTypeViewModel> value);

  dynamic fetchCachedTransactionTypes(String key);

  bool isTransactionTypesCached(String key);
}
