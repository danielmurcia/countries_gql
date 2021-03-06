// Mocks generated by Mockito 5.0.15 from annotations
// in countries_gql/test/presentation/mocker/mocker.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;

import 'package:countries_gql/domain/models/continent.dart' as _i6;
import 'package:countries_gql/domain/models/country.dart' as _i8;
import 'package:countries_gql/domain/models/failure.dart' as _i5;
import 'package:countries_gql/domain/usecases/fetch_continents_usecase.dart'
    as _i3;
import 'package:countries_gql/domain/usecases/fetch_countries_usecase.dart'
    as _i7;
import 'package:countries_gql/domain/usecases/get_countries_next_page_usecase.dart'
    as _i9;
import 'package:dartz/dartz.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis

class _FakeEither_0<L, R> extends _i1.Fake implements _i2.Either<L, R> {}

/// A class which mocks [FetchContinentsUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockFetchContinentsUseCase extends _i1.Mock
    implements _i3.FetchContinentsUseCase {
  MockFetchContinentsUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Either<_i5.Failure, List<_i6.Continent>>> call() =>
      (super.noSuchMethod(Invocation.method(#call, []),
              returnValue:
                  Future<_i2.Either<_i5.Failure, List<_i6.Continent>>>.value(
                      _FakeEither_0<_i5.Failure, List<_i6.Continent>>()))
          as _i4.Future<_i2.Either<_i5.Failure, List<_i6.Continent>>>);
  @override
  String toString() => super.toString();
}

/// A class which mocks [FetchCountriesUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockFetchCountriesUseCase extends _i1.Mock
    implements _i7.FetchCountriesUseCase {
  MockFetchCountriesUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Either<_i5.Failure, List<_i8.Country>>> call(
          {String? continentId = r''}) =>
      (super.noSuchMethod(
          Invocation.method(#call, [], {#continentId: continentId}),
          returnValue: Future<_i2.Either<_i5.Failure, List<_i8.Country>>>.value(
              _FakeEither_0<_i5.Failure, List<_i8.Country>>())) as _i4
          .Future<_i2.Either<_i5.Failure, List<_i8.Country>>>);
  @override
  String toString() => super.toString();
}

/// A class which mocks [GetCountriesNextPageUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetCountriesNextPageUseCase extends _i1.Mock
    implements _i9.GetCountriesNextPageUseCase {
  MockGetCountriesNextPageUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  List<_i8.Country> call() => (super.noSuchMethod(Invocation.method(#call, []),
      returnValue: <_i8.Country>[]) as List<_i8.Country>);
  @override
  String toString() => super.toString();
}
