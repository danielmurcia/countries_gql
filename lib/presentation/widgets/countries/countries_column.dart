import 'package:countries_gql/domain/models/country.dart';
import 'package:countries_gql/presentation/bloc/continents/continents_cubit.dart';
import 'package:countries_gql/presentation/bloc/countries/countries_cubit.dart';
import 'package:countries_gql/presentation/widgets/countries/continent_picker.dart';
import 'package:countries_gql/presentation/widgets/countries/country_list.dart';
import 'package:countries_gql/presentation/widgets/country_detail/country_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CountriesColumn extends StatelessWidget {
  const CountriesColumn({this.smallScreen = false, Key? key}) : super(key: key);

  final bool smallScreen;

  @override
  Widget build(BuildContext context) {
    ContinentsCubit continentsCubit = BlocProvider.of<ContinentsCubit>(context);
    CountriesCubit countriesCubit = BlocProvider.of<CountriesCubit>(context);

    return Column(
      children: [
        AppBar(
          title: Text('Countries'),
          centerTitle: false,
        ),
        ContinentPicker(
          state: continentsCubit.state,
          onChanged: (String selectedContinentId) {
            continentsCubit.select(
              continentId: selectedContinentId,
            );
            countriesCubit.fetchCountries(
              continentId: selectedContinentId,
            );
          },
        ),
        Expanded(
          child: (countriesCubit.state is CountriesLoaded)
              ? CountryList(
                  countries: countriesCubit.state.countries,
                  onSelect: (String countryId) {
                    countriesCubit.selectCountry(countryId);
                    if (smallScreen) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => CountryDetail(
                            country: countriesCubit.state.countries
                                .firstWhere((Country c) => c.id == countryId),
                          ),
                        ),
                      );
                    }
                  },
                  onRefresh: () => countriesCubit.fetchCountries(),
                  onLoadMore: () => countriesCubit.loadNextPage(),
                )
              : Center(
                  child: CircularProgressIndicator(),
                ),
        ),
      ],
    );
  }
}
