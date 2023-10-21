import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../config/extensions/resposive.dart';
import '../../../../config/extensions/validators.dart';
import '../../../../config/helpers/images.dart';
import '../../../global/widgets/animations/fade_in_right.dart';
import '../../../global/widgets/animations/fade_in_up.dart';
import '../../../global/widgets/components/password_form_field.dart';
import '../cubit/login_cubit.dart';

/// The `LoginForm` class is a widget that displays a login form with email and password fields, and a submit button.
class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  void _submitForm(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
    context.read<LoginCubit>().onLogin(context);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginCubit>().formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.only(
                top: context.padding.top + context.hp(5),
              ),
              child: FadeInUp(
                delay: const Duration(milliseconds: 700),
                child: Container(
                  padding: const EdgeInsets.all(5),
                  width: context.wp(15),
                  height: context.wp(15),
                  child: SvgPicture.asset(
                    Images.logo,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: context.hp(2),
          ),
          const FadeInUp(
            delay: Duration(milliseconds: 300),
            child: Text(
              'Sign in to your account',
              style: TextStyle(
                // color: App.black,
                fontSize: 22,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(height: 30),
          SizedBox(
            width: context.isPhone ? context.wp(80) : 400,
            child: FadeInRight(
              delay: const Duration(milliseconds: 700),
              from: 200,
              child: Column(
                children: [
                  BlocBuilder<LoginCubit, LoginState>(
                    buildWhen: (previous, current) =>
                        previous.email != current.email,
                    builder: (context, state) {
                      return TextFormField(
                        autovalidateMode: AutovalidateMode.always,
                        decoration: const InputDecoration(
                          hintText: 'example@example.com',
                        ),
                        onSaved: context.read<LoginCubit>().onSaveEmail,
                        validator: (value) => (value ?? '').isValidEmail()
                            ? null
                            : 'Invalid email',
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 30),
          SizedBox(
            width: context.isPhone ? context.wp(80) : 400,
            child: FadeInRight(
              delay: const Duration(milliseconds: 800),
              from: 300,
              child: BlocBuilder<LoginCubit, LoginState>(
                buildWhen: (previous, current) =>
                    previous.password != current.password,
                builder: (context, state) {
                  return PasswordFormField(
                    autovalidateMode: AutovalidateMode.always,
                    onSaved: context.read<LoginCubit>().onSavePassword,
                    onFieldSubmitted: (_) => _submitForm(context),
                    validator: (value) => (value ?? '').isValidPassword()
                        ? null
                        : 'Invalid Password it should be at least 6 characters',
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 60),
          ElevatedButton(
            onPressed: () => _submitForm(context),
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(200, 45),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7.0),
              ),
            ),
            child: const Text('Login'),
          ),
        ],
      ),
    );
  }
}
