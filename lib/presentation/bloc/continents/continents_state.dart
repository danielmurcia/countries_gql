part of 'continents_cubit.dart';

abstract class ContinentsState extends Equatable {
  const ContinentsState({this.selectedName = 'All'});

  final String selectedName;

  @override
  List<Object> get props => [selectedName];
}

class ContinentsLoading extends ContinentsState {}

class ContinentsLoadFailed extends ContinentsState {}

class ContinentsLoaded extends ContinentsState {
  ContinentsLoaded(this.continents, {this.selectedName = 'All'});

  final List<Continent> continents;
  final String selectedName;

  @override
  List<Object> get props => [selectedName, continents];
}
