

import 'package:flutter/material.dart';
import '../view/profile_detail_view.dart';

abstract class ProfileDetailViewModel extends State<ProfileDetailView>
    with SingleTickerProviderStateMixin {
  late final TabController tabController;
  late final PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
    tabController = TabController(length: 3, vsync: this);
  }
}
