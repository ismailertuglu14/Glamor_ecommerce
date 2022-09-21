import 'package:client/product/enums/lottie_path_enum.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(LottiePathEnum.TEAMECOMMERCE.rawValue, repeat: false),
          const Text('Dilediğin yerde SAT!'),
          const Text('Dilediğin yerde AL!'),
        ],
      )),
    );
  }
}
