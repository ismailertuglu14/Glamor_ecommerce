import 'package:flutter/material.dart';

class NotFoundView extends StatelessWidget {
  const NotFoundView({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Not Found'),
      ),
    );
  }
}
