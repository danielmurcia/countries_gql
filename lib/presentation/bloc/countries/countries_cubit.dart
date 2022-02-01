import 'package:bloc/bloc.dart';
import 'package:collection/collection.dart';
import 'package:countries_gql/domain/models/country.dart';
import 'package:countries_gql/domain/models/failure.dart';
import 'package:countries_gql/domain/use_cases/fetch_countries_usecase.dart';
import 'package:countries_gql/domain/use_cases/get_countries_next_page_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

part 'countries_state.dart';

class CountriesCubit extends Cubit<CountriesState> {
  CountriesCubit(
    this._fetchCountriesUseCase,
    this._getNextPageUseCase,
  ) : super(CountriesLoading());

  final FetchCountriesUseCase _fetchCountriesUseCase;
  final GetCountriesNextPageUseCase _getNextPageUseCase;

  String _selectedId = '';
  List<Country> _countries = [];

  void fetchCountries({String continentId = ''}) async {
    emit(CountriesLoading());
    Either<Failure, List<Country>> result =
        await _fetchCountriesUseCase.call(continentId: continentId);

    _selectedId = '';

    result.fold(
      (Failure l) => emit(CountriesLoadFailed()),
      (List<Country> r) {
        _countries = r;
        _emitLoaded();
      },
    );
  }

  void loadNextPage() {
    _countries.addAll(_getNextPageUseCase.call());
    _emitLoaded();
  }

  void selectCountry(String countryId) {
    assert(
      _countries.firstWhereOrNull((Country c) => c.id == countryId) != null,
    );
    _selectedId = countryId;
    _emitLoaded();
  }

  void _emitLoaded() {
    emit(CountriesLoading());
    emit(CountriesLoaded(countries: _countries, selectedId: _selectedId));
  }
}
