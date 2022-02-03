import 'package:countries_gql/domain/global_state.dart';
import 'package:countries_gql/domain/models/continent.dart';
import 'package:countries_gql/domain/models/failure.dart';
import 'package:countries_gql/domain/repo/countries_repo.dart';
import 'package:dartz/dartz.dart';

class FetchContinentsUseCase {
  FetchContinentsUseCase(this._globalState, this._repository);

  final GlobalState _globalState;
  final CountriesRepository _repository;

  Future<Either<Failure, List<Continent>>> call() async {
    Either<Failure, List<Continent>> result =
        await _repository.getContinentList();

    result.fold(
      (_) => _globalState.continents = [],
      (List<Continent> list) => _globalState.continents = list,
    );

    return result;
  }
}
