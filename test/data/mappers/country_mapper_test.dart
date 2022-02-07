import 'package:countries_gql/data/mappers/continent_mapper.dart';
import 'package:countries_gql/data/mappers/country_mapper.dart';
import 'package:countries_gql/domain/models/country.dart';
import 'package:flutter_test/flutter_test.dart';

import '../mocker/mocker.dart';

void main() {
  test(
    'When $CountryMapper countries map function is called '
    'then the expected list is returned',
    () async {
      // arrange
      CountryMapper mapper = CountryMapper(ContinentMapper());

      // act
      List<Country> result = mapper.mapCountries(mockCountriesQueryResponse);

      // assert
      expect(result.length, mockCountriesQueryResponse.length);
      expect(result[0].name, 'Andorra');
      expect(result[0].capital, 'Andorra la Vella');
      expect(result[0].continent.id, 'EU');
      expect(result[1].id, 'CH');
      expect(result[1].nativeName, 'Schweiz');
      expect(result[1].phoneCode, '41');
      expect(result[1].emoji, '🇨🇭');
    },
  );
}
