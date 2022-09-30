import 'package:flutter/material.dart';

class BottomNavigatorModel {
  final IconData icon;
  final String title;

  BottomNavigatorModel({required this.icon, required this.title});
}

class BottomNavigatorListModel {
  late final List<BottomNavigatorModel> _items;
  BottomNavigatorListModel() {
    _items = [
      BottomNavigatorModel(icon: Icons.home, title: 'Feed'),
      BottomNavigatorModel(icon: Icons.shopping_cart_outlined, title: 'Ads'),
      BottomNavigatorModel(icon: Icons.add_circle_outline, title: 'Sell'),
      BottomNavigatorModel(icon: Icons.message_rounded, title: 'Messages'),
      BottomNavigatorModel(icon: Icons.person_outline_rounded, title: 'Profile')
    ];
  }

  List<BottomNavigationBarItem> toWidgets() {
    return _items
        .map((e) => BottomNavigationBarItem(icon: Icon(e.icon), label: e.title))
        .toList();
  }
}
