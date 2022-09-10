import 'package:client/product/enums/lottie_path_enum.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Screen2 extends StatelessWidget {
  const Screen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Lottie.asset(LottiePathEnum.CONVERSATION.rawValue, repeat: false),
        const Text('Dilediğin zaman iletişime geç'),
      ],
    ));
  }
}
