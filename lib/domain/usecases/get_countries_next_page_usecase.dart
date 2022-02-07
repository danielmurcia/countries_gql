import 'package:countries_gql/domain/global_state.dart';
import 'package:countries_gql/domain/models/country.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetCountriesNextPageUseCase {
  GetCountriesNextPageUseCase(this._globalState);

  final GlobalState _globalState;

  List<Country> call() => _globalState.nextPage();
}
