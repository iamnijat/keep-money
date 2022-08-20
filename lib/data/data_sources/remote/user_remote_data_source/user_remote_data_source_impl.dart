import '../../../services/graphql_service/index.dart';
import 'package:graphql/client.dart';

import 'user_remote_data_source.dart';

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  UserRemoteDataSourceImpl(this._graphqlService);

  final GraphqlService _graphqlService;

  @override
  Future<QueryResult> fetchUser(String query,
          {Map<String, dynamic>? variables}) async =>
      await _graphqlService.performQuery(query, variables: variables);

  @override
  Future<QueryResult> updateUser(String query,
          {Map<String, dynamic>? variables}) async =>
      await _graphqlService.performMutation(query, variables: variables);
}
