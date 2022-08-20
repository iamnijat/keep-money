import 'package:graphql/client.dart';

abstract class UserRemoteDataSource {
  Future<QueryResult> fetchUser(String query,
      {Map<String, dynamic>? variables});

  Future<QueryResult> updateUser(String query,
      {Map<String, dynamic>? variables});
}
