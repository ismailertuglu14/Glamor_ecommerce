import 'package:flutter/material.dart';

class ScaffoldPadding extends EdgeInsets {
  const ScaffoldPadding.paddingLow()
      : super.symmetric(vertical: 8, horizontal: 8);
  const ScaffoldPadding.paddingNormal()
      : super.symmetric(vertical: 16, horizontal: 16);
}
