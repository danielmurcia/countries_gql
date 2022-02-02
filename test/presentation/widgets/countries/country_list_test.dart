import 'package:countries_gql/presentation/widgets/countries/country_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../domain/mocker/mocker.dart';
import '../../utils.dart';

main() {
  group('$CountryList tests', () {
    testWidgets('Shows expected elements', (WidgetTester tester) async {
      // arrange
      Widget widget = makeTestableWidget(
        child: CountryList(
          countries: mockCountryList,
          onSelect: (_) {},
          onRefresh: () {},
          onLoadMore: () {},
        ),
      );

      // act
      await tester.pumpWidget(widget);
      await tester.pumpAndSettle();

      // assert
      Finder listFinder = find.byType(ListView);
      Finder tilesFinder = find.byType(ListTile);

      expect(listFinder, findsOneWidget);
      expect(tilesFinder, findsNWidgets(2));
    });
  });
}
