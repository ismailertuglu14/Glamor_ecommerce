import 'package:client/core/base/base_view_model.dart';
import 'package:flutter/material.dart';

import '../view/home_wrapper.dart';

abstract class HomeWrapperModel extends State<HomeWrapper> {
  late PageController pageController;
  int currentIndex = 0;
  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }
}
