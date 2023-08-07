
import 'package:flutter/material.dart';

typedef Transition = Widget Function(BuildContext, Animation<double>, Animation<double>, Widget);

abstract class Transitions {
  // ignore: prefer_function_declarations_over_variables
  static final Transition transition = (context, animation, secondaryAnimation, child) {
    const begin = Offset(0.0, 1.0);
    const end = Offset.zero;
    const curve = Curves.ease;

    final tween = Tween(begin: begin, end: end);
    final curvedAnimation = CurvedAnimation(
      parent: animation,
      curve: curve,
    );
    return SlideTransition(
      position: tween.animate(curvedAnimation),
      child: child,
    );
  };
}