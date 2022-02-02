import 'package:collection/collection.dart';
import 'package:countries_gql/domain/models/continent.dart';
import 'package:countries_gql/presentation/bloc/continents/continents_cubit.dart';
import 'package:countries_gql/presentation/common/fonts.dart';
import 'package:flutter/material.dart';

class ContinentPicker extends StatelessWidget {
  const ContinentPicker({
    required this.state,
    required this.onChanged,
    Key? key,
  }) : super(key: key);

  final ContinentsState state;
  final Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    List<Continent> continents = (state is ContinentsLoaded)
        ? (state as ContinentsLoaded).continents
        : [];

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      width: double.infinity,
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text('Continent: ', style: AppFonts.bodyText1),
          ),
          Expanded(
            flex: 3,
            child: DropdownButton<String>(
              key: Key('kDropdownButton'),
              value: state.selectedName,
              isExpanded: true,
              icon: const Icon(Icons.arrow_drop_down),
              alignment: AlignmentDirectional.bottomEnd,
              onChanged: (String? value) {
                String? id = continents
                    .firstWhereOrNull((Continent c) => c.name == value)
                    ?.id;
                onChanged(id ?? '');
              },
              items: [
                DropdownMenuItem<String>(
                  key: Key('kDropdownItem'),
                  value: 'All',
                  child: Text(
                    'All',
                    style: AppFonts.bodyText1,
                  ),
                ),
                ...continents
                    .map(
                      (Continent c) => DropdownMenuItem(
                        value: c.name,
                        child: Text(c.name),
                      ),
                    )
                    .toList(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
