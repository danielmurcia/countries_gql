import 'package:graphql/client.dart';

class CountriesQuery {
  CountriesQuery(this._client);

  final GraphQLClient _client;

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

    return await _client.query(options);
  }
}
