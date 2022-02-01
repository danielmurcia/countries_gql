import 'package:countries_gql/data/gql/gql_client.dart';
import 'package:countries_gql/data/gql/queries/continents_query.dart';
import 'package:countries_gql/data/gql/queries/countries_query.dart';
import 'package:countries_gql/data/mappers/continent%20mapper.dart';
import 'package:countries_gql/data/mappers/country_mapper.dart';
import 'package:countries_gql/domain/models/continent.dart';
import 'package:countries_gql/domain/models/country.dart';
import 'package:countries_gql/domain/models/failure.dart';
import 'package:countries_gql/domain/repos/countries_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:graphql/client.dart';

class CountriesRepositoryImpl implements CountriesRepository {
  // TODO Should be injected
  final CountriesQuery _countriesQuery =
      CountriesQuery(GqlClient.instance.client);
  final ContinentsQuery _continentsQuery =
      ContinentsQuery(GqlClient.instance.client);
  final CountryMapper _countryMapper = CountryMapper();
  final ContinentMapper _continentMapper = ContinentMapper();

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
