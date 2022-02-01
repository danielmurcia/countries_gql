import 'package:countries_gql/domain/models/continent.dart';
import 'package:countries_gql/domain/models/country.dart';
import 'package:countries_gql/presentation/widgets/countries/country_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../utils.dart';

main() {
  group('$CountryList tests', () {
    testWidgets('Shows expected elements', (WidgetTester tester) async {
      // arrange
      List<Country> countries = [
        Country(
          id: '0',
          name: 'Colombia',
          emoji: '🇨🇴',
          nativeName: '',
          phoneCode: '',
          capital: '',
          continent: Continent(id: 'SA', name: ''),
        ),
        Country(
          id: '1',
          name: 'Spain',
          emoji: '🇪🇸',
          nativeName: '',
          phoneCode: '',
          capital: '',
          continent: Continent(id: 'EU', name: ''),
        ),
      ];

      Widget widget = makeTestableWidget(
        child: CountryList(
          countries: countries,
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
