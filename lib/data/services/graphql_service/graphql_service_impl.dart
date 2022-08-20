part of graphql_service;

class GraphqlServiceImpl implements GraphqlService {
  late GraphQLClient _client;
  GraphqlServiceImpl() {
    HttpLink link = HttpLink(AppStrings.apiHost);

    _client = GraphQLClient(link: link, cache: GraphQLCache());
  }

  @override
  Future<QueryResult<Object?>> performMutation(String query,
      {Map<String, dynamic>? variables}) async {
    MutationOptions options = MutationOptions(
        document: gql(query),
        variables: variables!,
        fetchPolicy: FetchPolicy.noCache);

    final result = await _client.mutate(options);

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

    final result = await _client.query(options);

    return result;
  }
}
