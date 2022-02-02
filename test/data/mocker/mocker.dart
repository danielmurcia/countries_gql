import 'package:countries_gql/data/gql/gql_client.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([GqlClient])
main() {}

List<dynamic> mockContinentsQueryResponse = [
  {'code': 'AF', 'name': 'Africa'},
  {'code': 'SA', 'name': 'South America'},
];

List<dynamic> mockCountriesQueryResponse = [
  {
    'code': 'AD',
    'name': 'Andorra',
    'native': 'Andorra',
    'emoji': '🇦🇩',
    'phone': '376',
    'capital': 'Andorra la Vella',
    'continent': {
      'code': 'EU',
      'name': 'Europe',
    },
  },
  {
    'code': 'CH',
    'name': 'Switzerland',
    'native': 'Schweiz',
    'emoji': '🇨🇭',
    'phone': '41',
    'capital': 'Bern',
    'continent': {
      'code': 'EU',
      'name': 'Europe',
    },
  },
];
