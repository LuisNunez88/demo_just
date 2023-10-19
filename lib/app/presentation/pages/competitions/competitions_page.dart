import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../config/helpers/images.dart';
import 'cubit/competitions_cubit.dart';
import 'widgets/competition_tile.dart';

/// Displays a list of competitions and allows the user to log out.
class CompetitionsPage extends StatelessWidget {
  const CompetitionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CompetitionsCubit()..init(context),
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: false,
            elevation: 0,
            backgroundColor: Colors.white,
            leadingWidth: 120,
            title: const Text(
              'Competitions',
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
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: IconButton(
                  icon: const Icon(
                    Icons.exit_to_app,
                  ),
                  onPressed: () {
                    context.read<CompetitionsCubit>().logout(context);
                  },
                ),
              )
            ],
          ),
          body: BlocBuilder<CompetitionsCubit, CompetitionsState>(
            buildWhen: (previous, current) =>
                previous.isFetching != current.isFetching,
            builder: (context, state) {
              if (state.isFetching) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return ListView.builder(
                  itemCount: state.competitions.length,
                  itemBuilder: (_, index) {
                    final competition = state.competitions[index];
                    return CompetitionTile(
                      competition: competition,
                    );
                  },
                );
              }
            },
          ),
        );
      }),
    );
  }
}
