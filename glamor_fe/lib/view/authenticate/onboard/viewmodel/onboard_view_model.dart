import 'package:client/view/authenticate/onboard/view/onboard_view.dart';
import 'package:flutter/material.dart';

abstract class OnboardViewModel extends State<OnboardView> with ChangeNotifier {
  final PageController pageController = PageController();
  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  int currentPage = 0;
}
