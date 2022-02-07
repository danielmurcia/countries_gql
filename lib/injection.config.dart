// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'data/gql/gql_client.dart' as _i6;
import 'data/gql/queries/continents_query.dart' as _i7;
import 'data/gql/queries/countries_query.dart' as _i8;
import 'data/mappers/continent_mapper.dart' as _i3;
import 'data/mappers/country_mapper.dart' as _i4;
import 'data/repo/countries_repo_impl.dart' as _i10;
import 'domain/global_state.dart' as _i5;
import 'domain/repo/countries_repo.dart' as _i9;
import 'domain/usecases/fetch_continents_usecase.dart' as _i11;
import 'domain/usecases/fetch_countries_usecase.dart' as _i12;
import 'domain/usecases/get_countries_next_page_usecase.dart' as _i13;
import 'presentation/bloc/continents/continents_cubit.dart' as _i14;
import 'presentation/bloc/countries/countries_cubit.dart'
    as _i15; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.ContinentMapper>(() => _i3.ContinentMapper());
  gh.factory<_i4.CountryMapper>(
      () => _i4.CountryMapper(get<_i3.ContinentMapper>()));
  gh.singleton<_i5.GlobalState>(_i5.GlobalState());
  gh.singleton<_i6.GqlClient>(_i6.GqlClient());
  gh.factory<_i7.ContinentsQuery>(
      () => _i7.ContinentsQuery(get<_i6.GqlClient>()));
  gh.factory<_i8.CountriesQuery>(
      () => _i8.CountriesQuery(get<_i6.GqlClient>()));
  gh.factory<_i9.CountriesRepository>(() => _i10.CountriesRepositoryImpl(
      get<_i8.CountriesQuery>(),
      get<_i7.ContinentsQuery>(),
      get<_i4.CountryMapper>(),
      get<_i3.ContinentMapper>()));
  gh.factory<_i11.FetchContinentsUseCase>(() => _i11.FetchContinentsUseCase(
      get<_i5.GlobalState>(), get<_i9.CountriesRepository>()));
  gh.factory<_i12.FetchCountriesUseCase>(() => _i12.FetchCountriesUseCase(
      get<_i5.GlobalState>(), get<_i9.CountriesRepository>()));
  gh.factory<_i13.GetCountriesNextPageUseCase>(
      () => _i13.GetCountriesNextPageUseCase(get<_i5.GlobalState>()));
  gh.factory<_i14.ContinentsCubit>(
      () => _i14.ContinentsCubit(get<_i11.FetchContinentsUseCase>()));
  gh.factory<_i15.CountriesCubit>(() => _i15.CountriesCubit(
      get<_i12.FetchCountriesUseCase>(),
      get<_i13.GetCountriesNextPageUseCase>()));
  return get;
}
