import 'package:flutter/material.dart';

class CategoryView extends StatefulWidget {
  const CategoryView({super.key});
  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: dummyData.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: dummyData[index]['icon'],
            title: dummyData[index]['title'],
            trailing: const Icon(Icons.keyboard_arrow_right_rounded),
          );
        },
      ),
    );
  }

  final List dummyData = const [
    {
      "icon": Icon(Icons.phone_android_rounded),
      "title": Text('Phone'),
    },
    {
      "icon": Icon(Icons.computer),
      "title": Text('Electronic'),
    },
    {
      "icon": Icon(Icons.motorcycle),
      "title": Text('Motorcycle'),
    },
    {
      "icon": Icon(Icons.sports_football),
      "title": Text('Spor & Outdoor'),
    },
    {
      "icon": Icon(Icons.phone_android_rounded),
      "title": Text('Phone'),
    },
    {
      "icon": Icon(Icons.phone_android_rounded),
      "title": Text('Phone'),
    },
    {
      "icon": Icon(Icons.phone_android_rounded),
      "title": Text('Phone'),
    },
    {
      "icon": Icon(Icons.phone_android_rounded),
      "title": Text('Phone'),
    },
    {
      "icon": Icon(Icons.phone_android_rounded),
      "title": Text('Phone'),
    },
    {
      "icon": Icon(Icons.phone_android_rounded),
      "title": Text('Phone'),
    },
  ];
}
