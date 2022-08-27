part of graphql_service;

abstract class GraphqlService {
  Future<QueryResult> performQuery(String query,
      {Map<String, dynamic>? variables});

  Future<QueryResult> performMutation(String query,
      {Map<String, dynamic>? variables});
}
