import 'package:flutter/material.dart';

class SellView extends StatefulWidget {
  const SellView({super.key});
  @override
  State<SellView> createState() => _SellViewState();
}

class _SellViewState extends State<SellView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text('Sell'),
          ],
        ),
      ),
    );
  }
}
