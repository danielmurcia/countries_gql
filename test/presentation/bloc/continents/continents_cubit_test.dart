import 'package:bloc_test/bloc_test.dart';
import 'package:countries_gql/domain/models/failure.dart';
import 'package:countries_gql/domain/usecases/fetch_continents_usecase.dart';
import 'package:countries_gql/presentation/bloc/continents/continents_cubit.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../domain/mocker/mocker.dart';
import '../../mocker/mocker.mocks.dart';

void main() {
  group('$ContinentsCubit tests', () {
    late ContinentsCubit cubit;
    late FetchContinentsUseCase useCase;

    setUp(() {
      useCase = MockFetchContinentsUseCase();
      cubit = ContinentsCubit(useCase);
    });

    blocTest<ContinentsCubit, ContinentsState>(
      'fetchContinents function emits a ContinentsLoaded state when useCase works as expected',
      build: () {
        when(useCase.call()).thenAnswer(
          (_) async => Right(mockContinentList),
        );
        return cubit;
      },
      act: (ContinentsCubit cubit) => cubit.fetchContinents(),
      expect: () => [isA<ContinentsLoaded>()],
    );

    blocTest<ContinentsCubit, ContinentsState>(
      'fetchContinents function emits a ContinentsLoadFailed state when useCase returns a Failure',
      build: () {
        when(useCase.call()).thenAnswer(
          (_) async => Left(Failure('')),
        );
        return cubit;
      },
      act: (ContinentsCubit cubit) => cubit.fetchContinents(),
      expect: () => [isA<ContinentsLoadFailed>()],
    );

    blocTest<ContinentsCubit, ContinentsState>(
      'selectContinent function emits a ContinentsLoaded state when called',
      build: () {
        when(useCase.call()).thenAnswer(
          (_) async => Right(mockContinentList),
        );
        return cubit;
      },
      act: (ContinentsCubit cubit) => cubit.fetchContinents(),
      expect: () => [isA<ContinentsLoaded>()],
    );

    tearDown(() {
      cubit.close();
    });
  });
}
