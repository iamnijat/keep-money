part of hive_service;

class HiveServiceImpl implements HiveService {
  late Box userBox;

  late Box transactionTypeBox;

  @override
  Future<void> init() async {
    /// getting application document directory
    final appDocumentDirectory = await getApplicationDocumentsDirectory();
    final appDocumentPath = appDocumentDirectory.path;

    /// initialize [HiveAdapter] logic
    Hive.init(appDocumentPath);

    /// register UserViewModelAdapter component
    Hive.registerAdapter(UserViewModelAdapter());

    /// register TransactionViewModelAdapter component
    Hive.registerAdapter(TransactionViewModelAdapter());

    /// opening UserViewBox component
    userBox = await Hive.openBox('user_box');

    /// register TransactionTypeViewModelAdapter component
    Hive.registerAdapter(TransactionTypeViewModelAdapter());

    /// opening TransactionTypeViewBox component
    transactionTypeBox = await Hive.openBox('transaction_type_box');
  }

  @override
  void close() => Hive.close();

  /// UserViewBox
  @override
  Future<void> cacheUser(String key, UserViewModel value) async =>
      await userBox.put(key, value);

  @override
  fetchCachedUser(String key) => userBox.get(key, defaultValue: UserViewModel);

  @override
  bool isUserCached(String key) => userBox.containsKey(key);

  /// TransactionTypesViewBox
  @override
  Future<void> cacheTransactionTypes(
          String key, List<TransactionTypeViewModel> value) async =>
      await transactionTypeBox.put(key, value);

  @override
  dynamic fetchCachedTransactionTypes(String key) =>
      transactionTypeBox.get(key, defaultValue: <TransactionTypeViewModel>[]);

  @override
  bool isTransactionTypesCached(String key) =>
      transactionTypeBox.containsKey(key);
}
