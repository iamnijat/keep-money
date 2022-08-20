import '../../../services/graphql_service/index.dart';
import 'package:graphql/client.dart';

import 'transactions_remote_data_source.dart';

class TransactionsRemoteDataSourceImpl implements TransactionsRemoteDataSource {
  TransactionsRemoteDataSourceImpl(this._graphqlService);

  final GraphqlService _graphqlService;

  @override
  Future<QueryResult> createTransaction(String query,
          {Map<String, dynamic>? variables}) async =>
      await _graphqlService.performMutation(query, variables: variables);

  @override
  Future<QueryResult> removeTransaction(String query,
          {Map<String, dynamic>? variables}) async =>
      await _graphqlService.performMutation(query, variables: variables);
}
