import 'package:flutter/material.dart';

class CustomPadding extends EdgeInsets {
  const CustomPadding.paddingLow()
      : super.symmetric(vertical: 8, horizontal: 8);
  const CustomPadding.paddingNormal()
      : super.symmetric(vertical: 16, horizontal: 16);
  const CustomPadding.paddingHigh()
      : super.symmetric(vertical: 40, horizontal: 40);
  const CustomPadding.paddingNormal2() : super.only(bottom: 15, top: 60);
  const CustomPadding.padVertLow() : super.symmetric(vertical: 8);
}
