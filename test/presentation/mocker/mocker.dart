import 'package:countries_gql/domain/models/continent.dart';
import 'package:countries_gql/domain/models/country.dart';
import 'package:countries_gql/domain/usecases/fetch_continents_usecase.dart';
import 'package:countries_gql/domain/usecases/fetch_countries_usecase.dart';
import 'package:countries_gql/domain/usecases/get_countries_next_page_usecase.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([
  FetchContinentsUseCase,
  FetchCountriesUseCase,
  GetCountriesNextPageUseCase
])
void main() {}

Country mockCountry = Country(
  id: '0',
  name: 'Spain',
  emoji: '🇪🇸',
  nativeName: 'España',
  phoneCode: '34',
  capital: 'Madrid',
  continent: Continent(id: 'EU', name: 'Europe'),
);
