// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:graphql/client.dart' as _i5;
import 'package:injectable/injectable.dart' as _i2;

import 'data/gql/gql_client.dart' as _i9;
import 'data/gql/queries/continents_query.dart' as _i4;
import 'data/gql/queries/countries_query.dart' as _i6;
import 'data/mappers/continent_mapper.dart' as _i3;
import 'data/mappers/country_mapper.dart' as _i7;
import 'data/repo/countries_repo_impl.dart' as _i11;
import 'domain/global_state.dart' as _i8;
import 'domain/repo/countries_repo.dart' as _i10;
import 'domain/usecases/fetch_continents_usecase.dart' as _i12;
import 'domain/usecases/fetch_countries_usecase.dart' as _i13;
import 'domain/usecases/get_countries_next_page_usecase.dart' as _i14;
import 'presentation/bloc/continents/continents_cubit.dart' as _i15;
import 'presentation/bloc/countries/countries_cubit.dart'
    as _i16; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.ContinentMapper>(() => _i3.ContinentMapper());
  gh.factory<_i4.ContinentsQuery>(
      () => _i4.ContinentsQuery(get<_i5.GraphQLClient>()));
  gh.factory<_i6.CountriesQuery>(
      () => _i6.CountriesQuery(get<_i5.GraphQLClient>()));
  gh.factory<_i7.CountryMapper>(
      () => _i7.CountryMapper(get<_i3.ContinentMapper>()));
  gh.singleton<_i8.GlobalState>(_i8.GlobalState());
  gh.singleton<_i9.GqlClient>(_i9.GqlClient());
  gh.factory<_i10.CountriesRepository>(() => _i11.CountriesRepositoryImpl(
      get<_i6.CountriesQuery>(),
      get<_i4.ContinentsQuery>(),
      get<_i7.CountryMapper>(),
      get<_i3.ContinentMapper>()));
  gh.factory<_i12.FetchContinentsUseCase>(() => _i12.FetchContinentsUseCase(
      get<_i8.GlobalState>(), get<_i10.CountriesRepository>()));
  gh.factory<_i13.FetchCountriesUseCase>(() => _i13.FetchCountriesUseCase(
      get<_i8.GlobalState>(), get<_i10.CountriesRepository>()));
  gh.factory<_i14.GetCountriesNextPageUseCase>(
      () => _i14.GetCountriesNextPageUseCase(get<_i8.GlobalState>()));
  gh.factory<_i15.ContinentsCubit>(
      () => _i15.ContinentsCubit(get<_i12.FetchContinentsUseCase>()));
  gh.factory<_i16.CountriesCubit>(() => _i16.CountriesCubit(
      get<_i13.FetchCountriesUseCase>(),
      get<_i14.GetCountriesNextPageUseCase>()));
  return get;
}
