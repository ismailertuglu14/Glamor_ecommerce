import 'package:client/product/enums/lottie_path_enum.dart';
import 'package:client/view/authenticate/splash/viewmodel/splash_view_model.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends SplashViewModel {
  @override
  Widget build(BuildContext context) {
    final double w = MediaQuery.of(context).size.width / 3;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            LottiePathEnum.ECOMMERCE.rawValue,
          ),
          const SizedBox(height: 15),
          Lottie.asset(LottiePathEnum.LOADING.rawValue,
              width: w, fit: BoxFit.contain),
        ],
      ),
    );
  }
}
