import 'package:countries_gql/data/gql/gql_client.dart';
import 'package:graphql/client.dart';
import 'package:injectable/injectable.dart';

@injectable
class CountriesQuery {
  CountriesQuery(this._gql);

  final GqlClient _gql;

  Future<QueryResult> getCountries({String? continentId}) async {
    final QueryOptions options = QueryOptions(
      document: gql(
        r'''
        query getCountries($filter: CountryFilterInput!) {
          countries(filter: $filter) {
            code
            name
            native
            emoji
            phone
            capital
            continent {
              code
              name
            }
          }
        }
      ''',
      ),
      variables: {
        'filter': continentId != null
            ? {
                'continent': {'eq': continentId}
              }
            : {},
      },
    );

    return await _gql.client.query(options);
  }
}
