import 'package:client/view/home/feed/widgets/filter_modal.dart';
import 'package:flutter/material.dart';

extension FilterExtension on FilterModal {
  Future<T?> show<T>(BuildContext context) {
    return showModalBottomSheet(context: context, builder: (context) => this);
  }
}
