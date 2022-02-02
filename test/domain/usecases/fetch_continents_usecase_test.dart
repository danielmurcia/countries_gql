import 'package:countries_gql/domain/global_state.dart';
import 'package:countries_gql/domain/models/continent.dart';
import 'package:countries_gql/domain/models/failure.dart';
import 'package:countries_gql/domain/repos/countries_repo.dart';
import 'package:countries_gql/domain/usecases/fetch_continents_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../mocker/mocker.dart';
import '../mocker/mocker.mocks.dart';

void main() {
  late GlobalState globalState;
  late FetchContinentsUseCase useCase;
  late CountriesRepository repo;

  setUpAll(() async {
    repo = MockCountriesRepository();
    globalState = GlobalState.instance;
    useCase = FetchContinentsUseCase(globalState, repo);
  });

  group('$FetchContinentsUseCase tests', () async {
    test(
      'When usecase is called and repo returns a valid response '
      'then the expected list is returned',
      () async {
        // arrange
        when(() => repo.getContinentList())
            .thenAnswer(() async => right(mockContinentList));

        // act
        Either<Failure, List<Continent>> result = await useCase();

        // assert
        expect(result, mockContinentList);
        verify(globalState.continents == mockContinentList);
      },
    );
  });
}
