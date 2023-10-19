import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:go_router/go_router.dart';

import '../../../../config/router/routes.dart';
import '../../../../inject_repositories.dart';

part 'login_cubit.freezed.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const _Initial());

  final GlobalKey<FormState> formKey = GlobalKey();
  final _authRepository = Repositories.authentication;

  /// Update the email value in the state with the provided value.
  void onSaveEmail(String? valor) {
    emit(state.copyWith(email: valor!));
  }

  /// Update the password value in the state with the provided value.
  void onSavePassword(String? valor) {
    emit(state.copyWith(password: valor!));
  }

  /// Handles the login process, including form validation, saving form data, and displaying error
  /// messages or navigating to the countries page.
  Future<void> onLogin(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      emit(state.copyWith(isFetching: true));
      final result = await _authRepository.login(state.email, state.password);

      result.when(
        left: (error) {
          emit(state.copyWith(isFetching: false));
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(error.message ?? 'Email or password incorrect'),
            ),
          );
        },
        right: (user) async {
          context.goNamed(Routes.countries.name);
        },
      );
    }
  }
}
