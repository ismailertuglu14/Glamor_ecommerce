import 'package:client/core/base/base_view_model.dart';
import 'package:client/view/home/chats/view/chats_view.dart';
import 'package:client/view/home/feed/view/feed_view.dart';
import 'package:client/view/home/my_ads/view/myads_view.dart';
import 'package:client/view/home/profile/view/profile_view.dart';
import 'package:client/view/home/sell/sell_view.dart';
import 'package:client/view/home/category/view/category_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view/home_wrapper.dart';

abstract class HomeWrapperModel extends State<HomeWrapper> {
  late PageController pageController;
  int currentPage = 0;
  int bottomCurrentPage = 0;
  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 0, keepPage: true);
  }

  void slidePage(int index) {
    setState(() {
      bottomCurrentPage = index;
    });
  }

  void changePage(int index) {
    setState(() {
      currentPage = index;
    });
    pageController.animateToPage(currentPage,
        duration: const Duration(milliseconds: 500), curve: Curves.ease);
  }

  final List viewList = const [
    FeedView(),
    MyAdsView(),
    SellView(),
    ChatsView(),
    ProfileView(),
  ];
}
