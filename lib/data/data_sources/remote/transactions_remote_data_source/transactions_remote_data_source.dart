import 'package:graphql/client.dart';

abstract class TransactionsRemoteDataSource {
  Future<QueryResult> createTransaction(String query,
      {Map<String, dynamic>? variables});

  Future<QueryResult> removeTransaction(String query,
      {Map<String, dynamic>? variables});
}
