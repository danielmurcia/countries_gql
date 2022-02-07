import 'package:graphql/client.dart';
import 'package:injectable/injectable.dart';

@singleton
class GqlClient {
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
