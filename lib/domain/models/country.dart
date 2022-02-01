import 'package:equatable/equatable.dart';

import 'continent.dart';

class Country extends Equatable {
  Country({
    required this.id,
    required this.name,
    required this.emoji,
    required this.nativeName,
    required this.phoneCode,
    required this.capital,
    required this.continent,
  });

  final String id;
  final String name;
  final String emoji;
  final String nativeName;
  final String phoneCode;
  final String capital;
  final Continent continent;

  @override
  List<Object?> get props => [id];
}
