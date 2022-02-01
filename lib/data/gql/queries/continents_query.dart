import 'package:graphql/client.dart';

class ContinentsQuery {
  ContinentsQuery(this._client);

  final GraphQLClient _client;

  Future<QueryResult> getContinents() async {
    final QueryOptions options = QueryOptions(
      document: gql(
        r'''
        query getContinents() {
          continents() {
            code
            name
          }
        }
      ''',
      ),
    );

    return await _client.query(options);
  }
}
