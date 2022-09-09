import 'package:client/product/enums/lottie_path_enum.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(LottiePathEnum.TEAMECOMMERCE.rawValue),
          const Text('Dilediğin yerde SAT!'),
          const Text('Dilediğin yerde AL!'),
        ],
      )),
    );
  }
}
