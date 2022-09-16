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
          slidePage(value);
        }),
        itemCount: viewList.length,
        itemBuilder: (context, index) {
          return viewList[index];
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: false,
        currentIndex: bottomCurrentPage,
        onTap: (value) {
          changePage(value);
        },
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Feed'),
          BottomNavigationBarItem(
              icon: Icon(Icons.production_quantity_limits), label: 'MY ADS'),
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
