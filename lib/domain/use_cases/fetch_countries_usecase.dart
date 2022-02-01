import 'package:countries_gql/domain/global_state.dart';
import 'package:countries_gql/domain/models/country.dart';
import 'package:countries_gql/domain/models/failure.dart';
import 'package:countries_gql/domain/repos/countries_repo.dart';
import 'package:dartz/dartz.dart';

class FetchCountriesUseCase {
  FetchCountriesUseCase(this._globalState, this._repository);

  final GlobalState _globalState;
  final CountriesRepository _repository;

  Future<Either<Failure, List<Country>>> call({String continentId = ''}) async {
    Either<Failure, List<Country>> result = continentId.isEmpty
        ? await _repository.getCountryList()
        : await _repository.getCountriesByContinent(continentId);

    _globalState.resetList();

    late Either<Failure, List<Country>> response;
    result.fold(
      (Failure failure) {
        _globalState.countries = [];
        response = left(failure);
      },
      (List<Country> list) {
        _globalState.countries = list;
        response = right(_globalState.nextPage());
      },
    );
    return response;
  }
}
