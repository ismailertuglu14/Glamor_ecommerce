import 'package:client/product/enums/lottie_path_enum.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class NotFoundView extends StatelessWidget {
  const NotFoundView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset(
          LottiePathEnum.PAGENOTFOUND.rawValue,
          repeat: false,
        ),
      ),
    );
  }
}
