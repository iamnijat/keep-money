part of graphql_service;

class GraphqlServiceImpl implements GraphqlService {
  GraphqlServiceImpl(this.client);

  final GraphQLClient client;

  @override
  Future<QueryResult<Object?>> performMutation(String query,
      {Map<String, dynamic>? variables}) async {
    MutationOptions options = MutationOptions(
        document: gql(query),
        variables: variables!,
        fetchPolicy: FetchPolicy.noCache);

    final result = await client.mutate(options);

    return result;
  }

  @override
  Future<QueryResult<Object?>> performQuery(String query,
      {Map<String, dynamic>? variables}) async {
    QueryOptions options = variables != null
        ? QueryOptions(
            document: gql(query),
            fetchPolicy: FetchPolicy.noCache,
            variables: variables)
        : QueryOptions(document: gql(query), fetchPolicy: FetchPolicy.noCache);

    final result = await client.query(options);

    return result;
  }
}
