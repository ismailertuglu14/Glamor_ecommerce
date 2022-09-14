import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../viewmodel/home_wrapper_model.dart';

class HomeWrapper extends StatefulWidget {
  const HomeWrapper({super.key});

  @override
  State<HomeWrapper> createState() => _HomeWrapperState();
}

class _HomeWrapperState extends HomeWrapperModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(builder: (context) {
        return PageView.builder(
          controller: pageController,
          onPageChanged: ((value) {}),
          itemCount: viewList.length,
          itemBuilder: (context, index) {
            return viewList[index];
          },
        );
      }),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: false,
        currentIndex: context.watch<PageViewProvider>().currentIndex,
        onTap: (value) {
          context.read<PageViewProvider>().setIndex(value);
          Future.microtask(() {
            changePage(value);
          });
        },
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Feed'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_circle_outline), label: 'Sell'),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chat'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline), label: 'Profile'),
        ],
      ),
    );
  }
}
