import 'package:flutter/material.dart';


class DefaultTransition extends StatelessWidget {
  final Animation<double> primaryAnimation;
  final Animation<double>? secondaryAnimation;
  final Widget child;
  const DefaultTransition({
    required this.child,
    required this.primaryAnimation,
    this.secondaryAnimation,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // const begin = Offset(0.0, 1.0);
    // const end = Offset.zero;
    // const curve = Curves.ease;
    //
    // final tween = Tween(begin: begin, end: end);
    // final curvedAnimation = CurvedAnimation(
    //   parent: primaryAnimation,
    //   curve: curve,
    // );
    // position: tween.animate(curvedAnimation),
    return const FadeUpwardsPageTransitionsBuilder().buildTransitions(
      null, context, primaryAnimation, secondaryAnimation, child,
    );
  }
}
