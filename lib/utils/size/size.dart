import 'package:flutter/material.dart';

extension MediaQueryValues on BuildContext {
  double get mqHeight => MediaQuery.sizeOf(this).height;
  double get mqWidth => MediaQuery.sizeOf(this).width;
}
