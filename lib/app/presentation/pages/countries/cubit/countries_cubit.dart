import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:go_router/go_router.dart';

import '../../../../config/router/routes.dart';
import '../../../../domain/entities/country.dart';
import '../../../../inject_repositories.dart';

part 'countries_cubit.freezed.dart';
part 'countries_state.dart';

class CountriesCubit extends Cubit<CountriesState> {
  CountriesCubit() : super(const _Initial());

  final _countriesRepository = Repositories.countries;

  void init(BuildContext context) {
    getCountries(context);
  }

  /// The function `getCountries` fetches a list of countries and updates the state accordingly, displaying an error message
  /// if there is an error.
  Future<void> getCountries(BuildContext context) async {
    emit(state.copyWith(isFetching: true));
    final result = await _countriesRepository.getCountries();

    result.when(
      left: (error) {
        emit(state.copyWith(isFetching: false));
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(error.message ?? 'Something went wrong'),
          ),
        );
      },
      right: (countries) {
        emit(state.copyWith(
            data: countries, countries: countries, isFetching: false));
      },
    );
  }

  /// The function filters a list of countries based on a given value.
  ///
  /// Args:
  ///   value (String): The parameter "value" is a string that represents the search value or keyword that will be used to
  /// filter the list of countries.
  void filterCountries(String value) {
    emit(state.copyWith(
        countries: state.data
            .where((element) =>
                element.name.toLowerCase().contains(value.toLowerCase()))
            .toList()));
  }

  /// The function sets the current country and navigates to the competitions page.
  void onSelectCountry(BuildContext context, String id) {
    _countriesRepository.setCurrentCountry(id);
    context.goNamed(Routes.competitions.name);
  }
}
