import 'package:countries_gql/domain/global_state.dart';
import 'package:countries_gql/domain/models/continent.dart';
import 'package:countries_gql/domain/models/failure.dart';
import 'package:countries_gql/domain/repo/countries_repo.dart';
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

  group('$FetchContinentsUseCase tests', () {
    test(
      'When usecase is called and repo returns a valid response '
      'then the expected list is returned',
      () async {
        // arrange
        Either<Failure, List<Continent>> mockResponse =
            right(mockContinentList);
        when(repo.getContinentList()).thenAnswer((_) async => mockResponse);

        // act
        Either<Failure, List<Continent>> result = await useCase.call();

        // assert
        expect(result, mockResponse);
        expect(globalState.continents, mockContinentList);
      },
    );

    test(
      'When usecase is called and repo returns an invalid response '
      'then a Failure is returned',
      () async {
        // arrange
        Either<Failure, List<Continent>> mockResponse =
            left(Failure('some error'));
        when(repo.getContinentList()).thenAnswer((_) async => mockResponse);

        // act
        Either<Failure, List<Continent>> result = await useCase.call();

        // assert
        expect(result, mockResponse);
      },
    );
  });
}
