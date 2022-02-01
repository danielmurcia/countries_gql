import 'package:equatable/equatable.dart';

class Continent extends Equatable {
  Continent({
    required this.id,
    required this.name,
  });

  final String id;
  final String name;

  @override
  List<Object?> get props => [id];
}
