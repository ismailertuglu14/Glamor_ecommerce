import 'package:client/view/home/my_ads/viewmodel/myads_view_model.dart';
import 'package:flutter/material.dart';

class MyAdsView extends StatefulWidget {
  const MyAdsView({super.key});
  @override
  State<MyAdsView> createState() => _MyAdsViewState();
}

class _MyAdsViewState extends MyAdsViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text('My Ads'),
          ],
        ),
      ),
    );
  }
}
