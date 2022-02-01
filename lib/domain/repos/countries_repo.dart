import 'package:countries_gql/domain/models/continent.dart';
import 'package:countries_gql/domain/models/country.dart';
import 'package:countries_gql/domain/models/failure.dart';
import 'package:dartz/dartz.dart';

abstract class CountriesRepository {
  Future<Either<Failure, List<Continent>>> getContinentList();
  Future<Either<Failure, List<Country>>> getCountryList();
  Future<Either<Failure, List<Country>>> getCountriesByContinent(
      String continentId);
}
