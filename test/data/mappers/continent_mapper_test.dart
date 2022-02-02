import 'package:countries_gql/data/mappers/continent_mapper.dart';
import 'package:countries_gql/domain/models/continent.dart';
import 'package:flutter_test/flutter_test.dart';

import '../mocker/mocker.dart';

void main() {
  test(
    'When $ContinentMapper continents map function is called '
    'then the expected list is returned',
    () async {
      // arrange
      ContinentMapper mapper = ContinentMapper();

      // act
      List<Continent> result =
          mapper.mapContinents(mockContinentsQueryResponse);

      // assert
      expect(result.length, mockContinentsQueryResponse.length);
      expect(result[0].name, 'Africa');
      expect(result[1].id, 'SA');
    },
  );
}
