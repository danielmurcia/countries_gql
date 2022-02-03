import 'package:countries_gql/domain/global_state.dart';
import 'package:countries_gql/domain/models/country.dart';
import 'package:countries_gql/domain/usecases/get_countries_next_page_usecase.dart';
import 'package:flutter_test/flutter_test.dart';

import '../mocker/mocker.dart';

void main() {
  late GlobalState globalState;
  late GetCountriesNextPageUseCase useCase;

  setUpAll(() async {
    globalState = GlobalState.instance;
    useCase = GetCountriesNextPageUseCase(globalState);
  });

  test(
    'When $GetCountriesNextPageUseCase is called and repo returns a valid response '
    'then the expected list is returned',
    () async {
      // arrange
      globalState.countries = mockCountryList;

      // act
      List<Country> result = useCase.call();

      // assert
      expect(result, mockCountryList);
    },
  );
}
