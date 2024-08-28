import 'package:flutter/material.dart';

class SlidingText extends StatelessWidget {
  const SlidingText({
    super.key,
    required this.slidingAnimation,
    required this.animationController,
  });

  final Animation<Offset> slidingAnimation;
  final AnimationController animationController;

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: slidingAnimation,
      child: AnimatedBuilder(
        animation: animationController,
        builder: (context, child) => Opacity(
          opacity: animationController.value,
          child: child,
        ),
        child: const Text(
          'Read Free Books',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
          ),
        ),
      ),
    );
  }
}
