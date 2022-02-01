import 'package:countries_gql/domain/models/continent.dart';
import 'package:countries_gql/domain/models/country.dart';
import 'package:countries_gql/presentation/widgets/country_detail/country_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../utils.dart';

main() {
  group('$CountryDetail tests', () {
    testWidgets('Shows expected elements', (WidgetTester tester) async {
      // arrange
      Country country = Country(
        id: '0',
        name: 'Spain',
        emoji: '🇪🇸',
        nativeName: 'España',
        phoneCode: '34',
        capital: 'Madrid',
        continent: Continent(id: 'EU', name: 'Europe'),
      );

      Widget widget = makeTestableWidget(
        child: CountryDetail(
          country: country,
        ),
      );

      // act
      await tester.pumpWidget(widget);
      await tester.pumpAndSettle();

      // assert
      Finder flagFinder = find.text(country.emoji);
      Finder nameFinder = find.text(country.name);
      Finder nativeNameFinder = find.text(country.nativeName);
      Finder phoneCodeFinder = find.text(country.phoneCode);
      Finder capitalFinder = find.text(country.capital);
      Finder continentFinder = find.text(country.continent.name);

      expect(flagFinder, findsOneWidget);
      expect(nameFinder, findsOneWidget);
      expect(nativeNameFinder, findsOneWidget);
      expect(phoneCodeFinder, findsOneWidget);
      expect(capitalFinder, findsOneWidget);
      expect(continentFinder, findsOneWidget);
    });
  });
}
