import 'package:graphql/client.dart';

import '../../../services/graphql_service/index.dart';
import 'transaction_types_remote_data_source.dart';

class TransactionTypesRemoteDataSourceImpl
    implements TransactionTypesRemoteDataSource {
  TransactionTypesRemoteDataSourceImpl(this._graphqlService);

  final GraphqlService _graphqlService;

  @override
  Future<QueryResult> fetchTransactionTypes(String query,
          {Map<String, dynamic>? variables}) async =>
      await _graphqlService.performQuery(query, variables: variables);
}
