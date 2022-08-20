import '../../../services/graphql_service/index.dart';
import 'package:graphql/client.dart';

import 'auth_remote_data_source.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  AuthRemoteDataSourceImpl(this._graphqlService);

  final GraphqlService _graphqlService;

  @override
  Future<QueryResult> register(String query,
          {Map<String, dynamic>? variables}) async =>
      await _graphqlService.performMutation(query, variables: variables);
}
