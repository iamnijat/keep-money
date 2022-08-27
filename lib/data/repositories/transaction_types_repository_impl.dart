import '../../core/services/network_service/network_service.dart';
import '../data_sources/remote/transaction_types_remote_data_source/transaction_types_remote_data_source.dart';

import '../../core/error/exceptions.dart';
import '../../core/utils/either.dart';
import '../../core/error/failures.dart';
import '../../core/utils/transaction_types_util.dart';
import '../../domain/repositories/transaction_types_repository.dart';
import '../data_sources/local/transaction_types_local_data_source/transaction_types_local_data_source.dart';
import '../models/hive_adapters/transaction_type_view_model/transaction_type_view_model.dart';

class TransactionTypesRepositoryImpl implements TransactionTypesRepository {
  final TransactionTypesRemoteDataSource remoteDataSource;
  final TransactionTypesLocalDataSource localDataSource;
  final NetworkService networkService;

  TransactionTypesRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkService,
  });

  @override
  Future<Either<Failure, List<TransactionTypeViewModel>?>>
      fetchTransactionTypes(String query,
          {Map<String, dynamic>? variables}) async {
    if (await networkService.isConnected) {
      try {
        final result = await remoteDataSource.fetchTransactionTypes(query,
            variables: variables);
        final typesData =
            TransactionTypesUtil.getTypes(types: result.data?['categories']);

        localDataSource.cacheTransactionTypes(typesData);
        return Success(typesData);
      } catch (_) {
        return const Error(Failure.other());
      }
    } else {
      try {
        final transactionTypes = <TransactionTypeViewModel>[];
        final result = localDataSource.fetchTransactionTypes();

        result.forEach(transactionTypes.add);

        return Success(transactionTypes);
      } on CacheException {
        return const Error(Failure.cache());
      }
    }
  }
}
