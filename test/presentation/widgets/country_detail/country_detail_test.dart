import 'package:countries_gql/domain/models/continent.dart';
import 'package:countries_gql/domain/models/country.dart';
import 'package:countries_gql/presentation/widgets/country_detail/country_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../mocker/mocker.dart';
import '../../utils.dart';

main() {
  group('$CountryDetail tests', () {
    testWidgets('Shows expected elements', (WidgetTester tester) async {
      // arrange
      Widget widget = makeTestableWidget(
        child: CountryDetail(
          country: mockCountry,
        ),
      );

      // act
      await tester.pumpWidget(widget);
      await tester.pumpAndSettle();

      // assert
      Finder flagFinder = find.text(mockCountry.emoji);
      Finder nameFinder = find.text(mockCountry.name);
      Finder nativeNameFinder = find.textContaining(mockCountry.nativeName);
      Finder phoneCodeFinder = find.textContaining(mockCountry.phoneCode);
      Finder capitalFinder = find.textContaining(mockCountry.capital);
      Finder continentFinder = find.textContaining(mockCountry.continent.name);

      expect(flagFinder, findsOneWidget);
      expect(nameFinder, findsOneWidget);
      expect(nativeNameFinder, findsOneWidget);
      expect(phoneCodeFinder, findsOneWidget);
      expect(capitalFinder, findsOneWidget);
      expect(continentFinder, findsOneWidget);
    });
  });
}
