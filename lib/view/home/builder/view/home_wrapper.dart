import 'package:flutter/material.dart';

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
      body: PageView.builder(
        controller: pageController,
        onPageChanged: ((value) {
          setState(() {
            currentIndex = value;
          });
        }),
        itemCount: 3,
        itemBuilder: (context, index) {
          return Center(
            child: Text(index.toString()),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: false,
        currentIndex: currentIndex,
        onTap: (value) {
          pageController.animateToPage(
              duration: const Duration(milliseconds: 500),
              curve: Curves.linear,
              value);
          setState(() {
            currentIndex = value;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Feed'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Category'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline), label: 'Profile'),
        ],
      ),
    );
  }
}
