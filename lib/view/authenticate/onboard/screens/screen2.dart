import 'package:client/product/enums/lottie_path_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lottie/lottie.dart';

class Screen2 extends StatefulWidget {
  const Screen2({super.key});

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Lottie.asset(LottiePathEnum.CONVERSATION.rawValue),
        const Text('Dilediğin zaman iletişime geç'),
      ],
    ));
  }
}
