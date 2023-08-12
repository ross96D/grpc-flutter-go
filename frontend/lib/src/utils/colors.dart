import 'package:flutter/material.dart';

// Color foregroundColor(Color backgroundColor) {
//   return backgroundColor.computeLuminance() > 0.5 ? Colors.black12 : Colors.white70;
// }

abstract class MColor {
  static const Color foregroundColor = Colors.white70;

  static const Color textBackgroundColor =Color.fromARGB(255, 6, 46, 73);

  static const Color scaffoldBackground = Colors.black12;
}