import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../config/helpers/images.dart';
import 'cubit/countries_cubit.dart';
import 'widgets/list_countries.dart';
import 'widgets/loading_countries.dart';

/// The `CountriesPage` class is a stateless widget that displays a list of countries and handles the fetching of data.
class CountriesPage extends StatelessWidget {
  const CountriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CountriesCubit()..init(context),
      child: Scaffold(
        appBar: AppBar(
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.light,
          ),
          centerTitle: false,
          elevation: 0,
          backgroundColor: Colors.white,
          leadingWidth: 120,
          title: const Text(
            'Countries',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          leading: Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: SvgPicture.asset(
                Images.logo,
                width: 100,
              ),
            ),
          ),
        ),
        body: BlocBuilder<CountriesCubit, CountriesState>(
          buildWhen: (previous, current) =>
              previous.isFetching != current.isFetching,
          builder: (context, state) {
            if (state.isFetching) {
              return const LoadingList();
            } else {
              return const ListCountries();
            }
          },
        ),
      ),
    );
  }
}
