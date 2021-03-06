import 'package:countries_gql/domain/models/country.dart';
import 'package:countries_gql/injection.dart';
import 'package:countries_gql/presentation/bloc/continents/continents_cubit.dart';
import 'package:countries_gql/presentation/bloc/countries/countries_cubit.dart';
import 'package:countries_gql/presentation/common/dimens.dart';
import 'package:countries_gql/presentation/widgets/countries/countries_column.dart';
import 'package:countries_gql/presentation/widgets/country_detail/country_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ContinentsCubit>(
          lazy: false,
          create: (BuildContext context) =>
              getIt<ContinentsCubit>()..fetchContinents(),
        ),
        BlocProvider<CountriesCubit>(
          create: (_) => getIt<CountriesCubit>()..fetchCountries(),
        ),
      ],
      child: HomeScreenWidget(),
    );
  }
}

class HomeScreenWidget extends StatelessWidget {
  const HomeScreenWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ContinentsCubit, ContinentsState>(
        builder: (_, continentsState) => (continentsState is ContinentsLoaded)
            ? BlocBuilder<CountriesCubit, CountriesState>(
                builder: (_, countriesState) => LayoutBuilder(
                  builder: (_, BoxConstraints dimens) {
                    if (dimens.maxWidth >= AppDimens.tabletBreakpoint) {
                      return Row(
                        children: [
                          Container(
                            width: AppDimens.countryListSize,
                            child: CountriesColumn(),
                          ),
                          VerticalDivider(
                            width: 0,
                          ),
                          Expanded(
                            child: (countriesState.selectedId.isEmpty)
                                ? Scaffold(
                                    appBar: AppBar(),
                                    body: Center(
                                      child: Text('No country selected'),
                                    ),
                                  )
                                : CountryDetail(
                                    country:
                                        countriesState.countries.firstWhere(
                                      (Country c) =>
                                          c.id == countriesState.selectedId,
                                    ),
                                  ),
                          ),
                        ],
                      );
                    }
                    return CountriesColumn(smallScreen: true);
                  },
                ),
              )
            : Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
