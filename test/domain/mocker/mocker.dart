import 'package:countries_gql/domain/models/continent.dart';
import 'package:countries_gql/domain/models/country.dart';
import 'package:countries_gql/domain/repo/countries_repo.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([CountriesRepository])
void main() {}

List<Continent> mockContinentList = [
  Continent(id: 'SA', name: 'South America')
];

List<Country> mockCountryList = [
  Country(
    id: '0',
    name: 'Colombia',
    emoji: '🇨🇴',
    nativeName: '',
    phoneCode: '',
    capital: '',
    continent: Continent(id: 'SA', name: ''),
  ),
  Country(
    id: '1',
    name: 'Spain',
    emoji: '🇪🇸',
    nativeName: '',
    phoneCode: '',
    capital: '',
    continent: Continent(id: 'EU', name: ''),
  ),
];
