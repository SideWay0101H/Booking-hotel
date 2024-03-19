import 'package:flutter/material.dart';

class ColorPalette {
  static const Color primaryColor = Color(0xFF6357CC);
  static const Color secondColor = Color(0xFF8F67E8);
  static const Color yellowColor = Color(0xFFFE9C5E);
  static const Color dividerColor = Color(0xFFE5E7EB);
  static const Color textColor = Color(0xFF323848);
  static const Color subtitleColor = Color(0xFF838383);
  static const Color backgroundScaffoldColor = Color(0xFFF2F2F2);
}

class Gradients {
  static const Gradient defaultGradientBackground = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomLeft,
    colors: [
      ColorPalette.secondColor,
      ColorPalette.primaryColor,
    ]
  );
}
