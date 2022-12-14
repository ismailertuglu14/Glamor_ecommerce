import 'package:client/view/home/chats/view/chats_view.dart';
import 'package:client/view/home/chats/view/favorites_view.dart';
import 'package:client/view/home/chats/view/messages_view.dart';
import 'package:flutter/material.dart';

abstract class ChatsViewModel extends State<ChatsView>
    with TickerProviderStateMixin {
  late final TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  // Top tab bar
  TabBar tab() {
    return TabBar(
      padding: EdgeInsets.zero,
      onTap: (int index) {},
      controller: tabController,
      tabs: MyTabViews.values
          .map((e) => Tab(
                text: e.name,
              ))
          .toList(),
    );
  }

  // Body Tab View
  tabbarView() {
    return TabBarView(
      controller: tabController,
      children: const [
        MessagesView(),
        FavoritesView(),
      ],
    );
  }
}

// ignore: constant_identifier_names
enum MyTabViews { Selling, Buying }
