import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../config/extensions/resposive.dart';
import '../../../config/helpers/images.dart';
import '../../../config/theme/app_colors.dart';
import '../../global/widgets/animations/fade_in_down.dart';
import '../../global/widgets/animations/fade_in_up.dart';
import 'cubit/splash_cubit.dart';

/// The `SplashPage` class is a stateless widget that displays a splash screen with a logo and a text
/// while verify if the user is logged in.
class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      lazy: false,
      create: (context) => SplashCubit()..init(context),
      child: Scaffold(
        body: Container(
          height: context.height,
          color: AppColors.splashBg,
          child: Stack(
            children: [
              Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    FadeInDown(
                      delay: const Duration(milliseconds: 700),
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        width: context.wp(40),
                        height: context.wp(40),
                        child: SvgPicture.asset(
                          Images.logo,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.only(
                    bottom: context.padding.bottom + context.hp(5),
                  ),
                  child: const FadeInUp(
                    delay: Duration(milliseconds: 700),
                    child: Text('By Luis Nuñez'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
