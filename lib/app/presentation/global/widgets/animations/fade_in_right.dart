import 'dart:async';

import 'package:flutter/material.dart';

class FadeInRight extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final Duration delay;
  final double from;
  const FadeInRight({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 700),
    this.delay = const Duration(milliseconds: 0),
    this.from = 100,
  });

  @override
  State<FadeInRight> createState() => _FadeInRightState();
}

class _FadeInRightState extends State<FadeInRight>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late Animation<double> _opacity;

  /// is the widget disposed?
  bool disposed = false;

  @override
  void initState() {
    super.initState();

    /// Create an animation controller

    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    /// The code is creating an animation for the position widget.

    _animation =
        Tween<double>(begin: widget.from, end: 0).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));

    /// Creating an animation for the opacity of the widget being animated.

    _opacity = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
      parent: _controller,
      curve: const Interval(0, 0.65),
    ));

    Future.delayed(widget.delay, () {
      /// Checking if the widget has been disposed before animate

      if (!disposed) {
        _controller.forward();
      }
    });
  }

  @override
  void dispose() {
    /// Dispose of the animation controller

    disposed = true;
    _controller.dispose();
    super.dispose();
  }

  /// Create a animation effect
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.translate(
            offset: Offset(_animation.value, 0),
            child: Opacity(
              opacity: _opacity.value,
              child: widget.child,
            ));
      },
    );
  }
}
