import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../global/widgets/components/search_widget.dart';
import '../cubit/countries_cubit.dart';
import 'country_tile.dart';

/// Displays a list of countries using a custom scroll view and a grid layout.
class ListCountries extends StatelessWidget {
  const ListCountries({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CountriesCubit, CountriesState>(
      buildWhen: (previous, current) => previous.countries != current.countries,
      builder: (context, state) {
        return CustomScrollView(
          slivers: [
            SliverAppBar(
              title: SearchWidget(
                onChange: (_, value) =>
                    context.read<CountriesCubit>().filterCountries(value),
              ),
              floating: true,
            ),
            SliverPadding(
              padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
              sliver: SliverGrid.builder(
                itemCount: state.countries.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                ),
                itemBuilder: (_, index) {
                  final country = state.countries[index];
                  return CountryTile(
                    country: country,
                    onPressed: () {
                      context
                          .read<CountriesCubit>()
                          .onSelectCountry(context, country.id);
                    },
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
