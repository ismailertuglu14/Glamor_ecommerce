import 'package:client/view/home/chats/viewmodel/chats_view_model.dart';
import 'package:flutter/material.dart';

class ChatsView extends StatefulWidget {
  const ChatsView({super.key});

  @override
  State<ChatsView> createState() => _ChatsViewState();
}

class _ChatsViewState extends ChatsViewModel {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: MyTabViews.values.length,
      child: Scaffold(
        extendBody: true,
        appBar: tab(),
        body: tabbarView(),
      ),
    );
  }
}
