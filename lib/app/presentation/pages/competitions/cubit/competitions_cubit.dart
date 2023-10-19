import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:go_router/go_router.dart';

import '../../../../config/router/routes.dart';
import '../../../../domain/entities/competition.dart';
import '../../../../inject_repositories.dart';

part 'competitions_cubit.freezed.dart';
part 'competitions_state.dart';

class CompetitionsCubit extends Cubit<CompetitionsState> {
  CompetitionsCubit() : super(const _Initial());

  final _auth = Repositories.authentication;
  final _competitionRepository = Repositories.competition;
  final _countriesRepository = Repositories.countries;

  void init(BuildContext context) {
    getCompetitions(context);
  }

  /// Fetches competitions based on the current country and updates the state accordingly.
  Future<void> getCompetitions(BuildContext context) async {
    emit(state.copyWith(isFetching: true));
    final currentCountry = await _countriesRepository.getCurrentCountry() ?? '';
    final result = await _competitionRepository.getCompetitions(currentCountry);

    result.when(
      left: (error) {
        emit(state.copyWith(isFetching: false));
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(error.message ?? 'Something went wrong'),
          ),
        );
      },
      right: (data) {
        emit(state.copyWith(data: data, competitions: data, isFetching: false));
      },
    );
  }

  /// The `logout` function logs the user out, displays a snackbar with an error message if there is an error, and navigates
  /// to the login screen if the logout is successful.
  Future<void> logout(BuildContext context) async {
    final res = await _auth.logout();
    res.when(left: (error) {
      emit(state.copyWith(isFetching: false));
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(error.message ?? 'Something went wrong'),
        ),
      );
    }, right: (isOut) {
      if (isOut) {
        context.goNamed(Routes.login.name);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Something went wrong'),
          ),
        );
      }
    });
  }
}
