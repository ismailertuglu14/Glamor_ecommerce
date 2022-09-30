import 'package:client/view/home/chats/view/chats_view.dart';
import 'package:client/view/home/feed/view/feed_view.dart';
import 'package:client/view/home/my_ads/view/myads_view.dart';
import 'package:client/view/home/profile/view/profile_view.dart';
import 'package:client/view/home/sell/view/sell_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view/home_wrapper.dart';

abstract class HomeWrapperModel extends State<HomeWrapper> {
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 0);
  }

  void changePage(int index) {
    Provider.of<HomeProvider>(context, listen: false).currentIndex = index;
    pageController.jumpToPage(index);
  }
}

class HomeProvider extends ChangeNotifier {
  int currentIndex = 0;

  changePage(int index) {
    currentIndex = index;
    notifyListeners();
  }
}

const List viewList = [
  FeedView(),
  MyAdsView(),
  SellView(),
  ChatsView(),
  ProfileView(),
];
