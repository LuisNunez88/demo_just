import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../../config/extensions/resposive.dart';

/// The `LoadingWidget` class is a widget that displays a loading animation in the center of the screen, with the option to
/// show or hide it based on a boolean value.
class LoadingWidget extends StatelessWidget {
  final bool show;
  const LoadingWidget({super.key, this.show = false});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        width: show ? context.width : 0,
        height: show ? context.height : 0,
        decoration: BoxDecoration(
          color: Colors.black45,
          borderRadius: BorderRadius.circular(show ? 0 : 50),
        ),
        child: const Center(
          child: SpinKitFadingCircle(color: Colors.white),
        ),
      ),
    );
  }
}
