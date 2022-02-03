import 'package:countries_gql/presentation/bloc/continents/continents_cubit.dart';
import 'package:countries_gql/presentation/widgets/countries/continent_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../domain/mocker/mocker.dart';
import '../../utils.dart';

main() {
  group('$ContinentPicker tests', () {
    testWidgets('Shows expected elements', (WidgetTester tester) async {
      // arrange
      Widget widget = makeTestableWidget(
        child: ContinentPicker(
          state: ContinentsLoaded(mockContinentList),
          onChanged: (_) {},
        ),
      );

      // act
      await tester.pumpWidget(widget);
      await tester.pumpAndSettle();

      // assert
      Finder dropdownFinder = find.byKey(Key('kDropdownButton'));
      expect(dropdownFinder, findsOneWidget);

      await tester.tap(dropdownFinder);
      await tester.pumpAndSettle();

      Finder dropdownItemFinder = find.byKey(Key('kDropdownItem'));
      expect(dropdownItemFinder, findsNWidgets(2)); // ['All', 'South America']
    });
  });
}
