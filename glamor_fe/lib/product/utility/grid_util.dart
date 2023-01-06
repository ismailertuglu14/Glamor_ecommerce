import 'package:flutter/material.dart';

class FeedGridDelegate extends SliverGridDelegateWithFixedCrossAxisCount {
  FeedGridDelegate({required double height, required double width})
      : super(
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          childAspectRatio: (width / height),
        );
}
