part of 'countries_cubit.dart';

abstract class CountriesState extends Equatable {
  CountriesState({this.selectedId = ''});

  final String selectedId;
  final List<Country> countries = [];

  @override
  List<Object> get props => [countries, selectedId];
}

class CountriesLoading extends CountriesState {}

class CountriesLoadFailed extends CountriesState {}

class CountriesLoaded extends CountriesState {
  CountriesLoaded({required this.countries, this.selectedId = ''});

  final String selectedId;
  final List<Country> countries;

  @override
  List<Object> get props => [countries, selectedId];
}
