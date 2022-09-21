// ignore_for_file: must_be_immutable

import 'package:client/view/authenticate/onboard/model/onboard_model.dart';
import 'package:flutter/cupertino.dart';

class OnboardCard extends StatefulWidget {
  OnboardModel model;
  OnboardCard({required this.model, super.key});

  @override
  State<OnboardCard> createState() => _OnboardCardState();
}

class _OnboardCardState extends State<OnboardCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(widget.model.title!),
      ],
    );
  }
}
