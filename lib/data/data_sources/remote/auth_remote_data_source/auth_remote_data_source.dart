import 'package:graphql/client.dart';

abstract class AuthRemoteDataSource {
  Future<QueryResult> register(String query, {Map<String, dynamic>? variables});
}
