import 'package:graphql/client.dart';
import 'package:keep_money/core/constants/strings.dart';

Future<void> main() async {
  print('apiHost = "${AppStrings.apiHost}"  (len ${AppStrings.apiHost.length})');
  print('apiKey  = "${AppStrings.apiKey}"   (len ${AppStrings.apiKey.length})');

  late final GraphQLClient client;
  try {
    client = GraphQLClient(
      link: HttpLink(AppStrings.apiHost,
          defaultHeaders: const {'x-api-key': AppStrings.apiKey}),
      cache: GraphQLCache(),
    );
    print('STEP 1 GraphQLClient construction: OK (no throw)');
  } catch (e) {
    print('STEP 1 GraphQLClient construction: THREW -> ${e.runtimeType}: $e');
    return;
  }

  try {
    final r = await client.mutate(MutationOptions(
      document: gql('mutation { createUser(name:"x") { id } }'),
      variables: const {},
      fetchPolicy: FetchPolicy.noCache,
    ));
    print('STEP 2 mutate: returned. hasException=${r.hasException}');
    print('STEP 2 exception: ${r.exception}');
  } catch (e) {
    print('STEP 2 mutate: THREW -> ${e.runtimeType}: $e');
  }
}
