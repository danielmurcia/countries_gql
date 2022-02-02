import 'package:countries_gql/domain/global_state.dart';
import 'package:countries_gql/domain/models/country.dart';
import 'package:countries_gql/domain/models/failure.dart';
import 'package:countries_gql/domain/repos/countries_repo.dart';
import 'package:countries_gql/domain/usecases/fetch_countries_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../mocker/mocker.dart';
import '../mocker/mocker.mocks.dart';

void main() {
  late GlobalState globalState;
  late FetchCountriesUseCase useCase;
  late CountriesRepository repo;

  setUpAll(() async {
    repo = MockCountriesRepository();
    globalState = GlobalState.instance;
    useCase = FetchCountriesUseCase(globalState, repo);
  });

  test(
    'When $FetchCountriesUseCase is called and repo returns a valid response '
    'then the expected list is returned',
    () async {
      // arrange
      Either<Failure, List<Country>> mockResponse = Right(mockCountryList);
      when(repo.getCountryList()).thenAnswer((_) async => mockResponse);

      // act
      Either<Failure, List<Country>> result = await useCase.call();

      // assert
      expect(result.isRight(), true);
      expect(globalState.countries, mockCountryList);
    },
  );
}
