import 'package:countries_gql/data/gql/gql_client.dart';
import 'package:graphql/client.dart';
import 'package:injectable/injectable.dart';

@injectable
class ContinentsQuery {
  ContinentsQuery(this._gql);

  final GqlClient _gql;

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

    return await _gql.client.query(options);
  }
}
