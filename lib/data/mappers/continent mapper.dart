import 'package:countries_gql/domain/models/continent.dart';

class ContinentMapper {
  List<Continent> mapContinents(List<dynamic> qglMaps) {
    return qglMaps.map((dynamic map) => mapContinent(map)).toList();
  }

  Continent mapContinent(Map<String, dynamic> map) {
    return Continent(id: map['code'], name: map['name']);
  }
}
