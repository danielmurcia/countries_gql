import 'package:countries_gql/data/mappers/continent_mapper.dart';
import 'package:countries_gql/domain/models/country.dart';
import 'package:injectable/injectable.dart';

@injectable
class CountryMapper {
  CountryMapper(this._continentMapper);

  final ContinentMapper _continentMapper;

  List<Country> mapCountries(List<dynamic> qglMaps) {
    return qglMaps.map((dynamic map) => mapCountry(map)).toList();
  }

  Country mapCountry(dynamic map) {
    return Country(
      id: map['code'],
      name: map['name'],
      nativeName: map['native'] ?? '',
      emoji: map['emoji'] ?? '',
      phoneCode: map['phone'] ?? '',
      capital: map['capital'] ?? '',
      continent: _continentMapper.mapContinent(map['continent']),
    );
  }
}
