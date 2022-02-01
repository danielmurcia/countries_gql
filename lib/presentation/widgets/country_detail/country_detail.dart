import 'package:countries_gql/domain/models/country.dart';
import 'package:countries_gql/presentation/common/fonts.dart';
import 'package:flutter/material.dart';

class CountryDetail extends StatelessWidget {
  const CountryDetail({required this.country, Key? key}) : super(key: key);

  final Country country;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          'Country details',
        ),
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(country.emoji, style: AppFonts.headline),
            Text(country.name, style: AppFonts.headline),
            Text(
              'Native name: ${country.nativeName}',
              style: AppFonts.bodyText1,
            ),
            Text(
              'Continent: ${country.continent.name}',
              style: AppFonts.bodyText1,
            ),
            Text(
              'Capital: ${country.capital}',
              style: AppFonts.bodyText1,
            ),
            Text(
              'Phone code: ${country.phoneCode}',
              style: AppFonts.bodyText1,
            ),
          ],
        ),
      ),
    );
  }
}
