import 'package:flutter/material.dart';

class ScaffoldPadding extends EdgeInsets {
  const ScaffoldPadding.paddingLow()
      : super.symmetric(vertical: 8, horizontal: 8);
  const ScaffoldPadding.paddingNormal()
      : super.symmetric(vertical: 16, horizontal: 16);

  /// This is the padding used in the Messages screen. [top: 32 px]
  const ScaffoldPadding.paddingTopHigh() : super.only(top: 32);
}
