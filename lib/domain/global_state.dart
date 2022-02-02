import 'package:collection/collection.dart';
import 'package:countries_gql/domain/models/continent.dart';
import 'package:countries_gql/domain/models/country.dart';

const COUNTRIES_PER_PAGE = 25;

class GlobalState {
  // Setup GlobalState as Singleton
  GlobalState._internal();
  static final GlobalState _instance = GlobalState._internal();

  static GlobalState get instance => _instance;

  int _nextPage = 0;

  List<Continent> continents = [];
  List<Country> countries = [];

  void resetList({String continentId = ''}) {
    assert(
      continentId.isEmpty ||
          continents.firstWhereOrNull((Continent c) => c.id == continentId) !=
              null,
    );

    _nextPage = 0;
  }

  List<Country> nextPage() {
    if (countries.length < _nextPage * COUNTRIES_PER_PAGE) {
      return [];
    }
    int endIndex = ((_nextPage + 1) * COUNTRIES_PER_PAGE) >= countries.length
        ? countries.length
        : (_nextPage + 1) * COUNTRIES_PER_PAGE;

    List<Country> page = countries.sublist(
      _nextPage * COUNTRIES_PER_PAGE,
      endIndex,
    );
    _nextPage++;
    return page;
  }
}
