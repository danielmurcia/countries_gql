import 'package:graphql/client.dart';

class GqlClient {
  // Setup GlobalState as Singleton
  GqlClient._internal();
  static final GqlClient _instance = GqlClient._internal();

  static GqlClient get instance => _instance;

  final Link _link = HttpLink(
    'https://countries.trevorblades.com/graphql',
  );

  GraphQLClient get client {
    return GraphQLClient(
      cache: GraphQLCache(),
      link: _link,
    );
  }
}
