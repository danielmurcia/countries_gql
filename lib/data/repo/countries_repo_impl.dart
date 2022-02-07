import 'package:countries_gql/data/gql/queries/continents_query.dart';
import 'package:countries_gql/data/gql/queries/countries_query.dart';
import 'package:countries_gql/data/mappers/continent_mapper.dart';
import 'package:countries_gql/data/mappers/country_mapper.dart';
import 'package:countries_gql/domain/models/continent.dart';
import 'package:countries_gql/domain/models/country.dart';
import 'package:countries_gql/domain/models/failure.dart';
import 'package:countries_gql/domain/repo/countries_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:graphql/client.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CountriesRepository)
class CountriesRepositoryImpl implements CountriesRepository {
  CountriesRepositoryImpl(
    this._countriesQuery,
    this._continentsQuery,
    this._countryMapper,
    this._continentMapper,
  );

  final CountriesQuery _countriesQuery;
  final ContinentsQuery _continentsQuery;
  final CountryMapper _countryMapper;
  final ContinentMapper _continentMapper;

  @override
  Future<Either<Failure, List<Continent>>> getContinentList() async {
    QueryResult result = await _continentsQuery.getContinents();

    if (result.hasException) {
      return left(Failure(result.exception.toString()));
    }

    try {
      List<Continent> continents =
          _continentMapper.mapContinents(result.data!['continents']);
      return right(continents);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Country>>> getCountriesByContinent(
    String continentId,
  ) async {
    return _fetchCountries(continentId);
  }

  @override
  Future<Either<Failure, List<Country>>> getCountryList() async {
    return _fetchCountries(null);
  }

  Future<Either<Failure, List<Country>>> _fetchCountries(
      String? continentId) async {
    QueryResult result =
        await _countriesQuery.getCountries(continentId: continentId);

    if (result.hasException) {
      return left(Failure(result.exception.toString()));
    }

    try {
      List<Country> countries =
          _countryMapper.mapCountries(result.data!['countries']);
      return right(countries);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
