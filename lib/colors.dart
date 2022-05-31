import 'package:flutter/material.dart';

class SolidColors {
  static const white = Color(0xFFFFFFFF);
  static const gray = Color(0xFFEDEDED);
  static const red = Color(0xFFFF8057);
  static const green = Color(0xFF01D088);

  static const scaffoldBgColor = Color(0xFFEDEDED);
}

class GradientColors {
  static final bgHomeGradient = [
    const Color(0xFFFFFFFF).withOpacity(0.3),
    const Color(0xFF01D088).withOpacity(0.3),

  ];
  static final bottomNavGradient = [
    const Color(0xFF01D088).withOpacity(0.22),
    const Color(0xFF01D088).withOpacity(0.05),
    //const Color(0xFFFFFFFF).withOpacity(0.30),
  ];
}