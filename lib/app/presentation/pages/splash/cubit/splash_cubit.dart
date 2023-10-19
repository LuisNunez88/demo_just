import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../config/router/routes.dart';
import '../../../../inject_repositories.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashState.idle);
  final _authRepository = Repositories.authentication;

  /// The `init` function checks if a user is signed in and if a country is selected, and navigates to the appropriate
  /// screen based on the results.
  init(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () async {
      _authRepository.isSignedIn.then((isSignedIn) {
        if (isSignedIn) {
          emit(SplashState.loggedIn);
          _authRepository.isCountrySelected.then((isCountrySelected) {
            if (isCountrySelected) {
              context.goNamed(Routes.mainMenu.name);
            } else {
              context.goNamed(Routes.countries.name);
            }
          });
        } else {
          emit(SplashState.noUserExist);
          context.goNamed(Routes.login.name);
        }
      });
    });
  }
}
