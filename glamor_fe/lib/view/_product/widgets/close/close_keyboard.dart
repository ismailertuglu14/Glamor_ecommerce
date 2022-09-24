import 'package:flutter/material.dart';

class CloseKeyboard extends StatelessWidget {
  final Widget widget;
  const CloseKeyboard({super.key, required this.widget});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: widget,
    );
  }
}
