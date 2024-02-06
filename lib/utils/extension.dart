import 'package:flutter/material.dart';

extension MediaQueryX on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  double get width => mediaQuery.size.width;

  double get height => mediaQuery.size.height;

  double wp(double value) => width * value / 100;

  double hp(double value) => height * value / 100;
}
