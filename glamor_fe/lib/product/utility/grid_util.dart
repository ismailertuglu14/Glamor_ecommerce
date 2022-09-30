import 'package:flutter/material.dart';

class FeedGridDelegate extends SliverGridDelegateWithFixedCrossAxisCount {
  FeedGridDelegate({required double height, required double width})
      : super(
          crossAxisSpacing: 20,
          mainAxisSpacing: 0,
          crossAxisCount: 2,
          childAspectRatio: (width / height),
        );
}
