import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../config/extensions/resposive.dart';
import '../../global/widgets/components/loading_widget.dart';
import 'cubit/login_cubit.dart';
import 'widgets/login_form.dart';

/// The `LoginPage` class is a stateless widget that displays a login form and a loading widget based on the state of a
/// `LoginCubit`.
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: Scaffold(
        body: Stack(
          children: [
            SizedBox(
              height: context.height,
              width: context.width,
              child: const SingleChildScrollView(child: LoginForm()),
            ),
            BlocBuilder<LoginCubit, LoginState>(
              buildWhen: (previous, current) =>
                  previous.isFetching != current.isFetching,
              builder: (context, state) {
                return LoadingWidget(
                  show: state.isFetching,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
