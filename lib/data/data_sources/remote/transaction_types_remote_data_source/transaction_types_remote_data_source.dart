import 'package:graphql/client.dart';

abstract class TransactionTypesRemoteDataSource {
  Future<QueryResult> fetchTransactionTypes(String query,
      {Map<String, dynamic>? variables});
}
