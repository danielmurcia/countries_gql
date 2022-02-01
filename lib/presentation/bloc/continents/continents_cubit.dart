import 'package:bloc/bloc.dart';
import 'package:collection/collection.dart';
import 'package:countries_gql/domain/models/continent.dart';
import 'package:countries_gql/domain/models/failure.dart';
import 'package:countries_gql/domain/use_cases/fetch_continents_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

part 'continents_state.dart';

class ContinentsCubit extends Cubit<ContinentsState> {
  ContinentsCubit(this._useCase) : super(ContinentsLoading());

  final FetchContinentsUseCase _useCase;

  List<Continent> _continents = [];

  void fetchContinents() async {
    Either<Failure, List<Continent>> result = await _useCase.call();

    result.fold(
      (Failure l) => emit(ContinentsLoadFailed()),
      (List<Continent> list) {
        _continents = list;
        emit(ContinentsLoaded(_continents));
      },
    );
  }

  void select({String continentId = ''}) {
    String? label = _continents
        .firstWhereOrNull((Continent c) => c.id == continentId)
        ?.name;
    emit(ContinentsLoaded(_continents, selectedName: label ?? 'All'));
  }
}
