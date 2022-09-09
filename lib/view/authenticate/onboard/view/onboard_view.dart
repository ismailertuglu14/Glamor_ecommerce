import 'package:client/view/authenticate/onboard/model/onboard_model.dart';
import 'package:client/view/authenticate/onboard/viewmodel/onboard_view_model.dart';
import 'package:client/view/authenticate/onboard/widgets/onboard_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class OnboardView extends StatefulWidget {
  const OnboardView({super.key});

  @override
  State<OnboardView> createState() => _OnboardViewState();
}

class _OnboardViewState extends OnboardViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: pageController,
        onPageChanged: (value) {
          // do something
        },
        itemCount: OnboardModels().onboardItems.length,
        itemBuilder: (context, index) {
          return OnboardModels().onboardItems[index];
        },
      ),
    );
  }
}
