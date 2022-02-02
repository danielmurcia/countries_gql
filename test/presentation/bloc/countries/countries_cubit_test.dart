import 'package:bloc_test/bloc_test.dart';
import 'package:countries_gql/domain/models/failure.dart';
import 'package:countries_gql/domain/usecases/fetch_countries_usecase.dart';
import 'package:countries_gql/domain/usecases/get_countries_next_page_usecase.dart';
import 'package:countries_gql/presentation/bloc/countries/countries_cubit.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../domain/mocker/mocker.dart';
import '../../mocker/mocker.mocks.dart';

void main() {
  group('$CountriesCubit tests', () {
    late CountriesCubit cubit;
    late FetchCountriesUseCase fetchUseCase;
    late GetCountriesNextPageUseCase nextPageUseCase;

    setUp(() {
      fetchUseCase = MockFetchCountriesUseCase();
      nextPageUseCase = MockGetCountriesNextPageUseCase();
      cubit = CountriesCubit(fetchUseCase, nextPageUseCase);
    });

    blocTest<CountriesCubit, CountriesState>(
      'fetchCountries function emits the expected states when useCase works as expected',
      build: () {
        when(fetchUseCase.call()).thenAnswer(
          (_) async => Right(mockCountryList),
        );
        return cubit;
      },
      act: (CountriesCubit cubit) => cubit.fetchCountries(),
      expect: () => [isA<CountriesLoading>(), isA<CountriesLoaded>()],
    );

    blocTest<CountriesCubit, CountriesState>(
      'fetchCountries function emits the expected states when useCase returns a Failure',
      build: () {
        when(fetchUseCase.call()).thenAnswer(
          (_) async => Left(Failure('')),
        );
        return cubit;
      },
      act: (CountriesCubit cubit) => cubit.fetchCountries(),
      expect: () => [isA<CountriesLoading>(), isA<CountriesLoadFailed>()],
    );

    blocTest<CountriesCubit, CountriesState>(
      'getNextPage function emits the expected states when useCase works as expected',
      build: () {
        when(nextPageUseCase.call()).thenAnswer(
          (_) => mockCountryList,
        );
        return cubit;
      },
      act: (CountriesCubit cubit) => cubit.loadNextPage(),
      expect: () => [isA<CountriesLoading>(), isA<CountriesLoaded>()],
    );

    tearDown(() {
      cubit.close();
    });
  });
}
