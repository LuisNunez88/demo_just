import 'package:flutter/material.dart';

class FadeIn extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final Duration delay;
  final double from;
  const FadeIn({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 700),
    this.delay = const Duration(milliseconds: 0),
    this.from = 100,
  });

  @override
  State<FadeIn> createState() => _FadeInState();
}

class _FadeInState extends State<FadeIn> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

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

    /// Creating an animation for the opacity of the widget being animated.

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    );

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
      animation: _animation,
      builder: (context, child) {
        return Opacity(
          opacity: _animation.value,
          child: widget.child,
        );
      },
    );
  }
}
