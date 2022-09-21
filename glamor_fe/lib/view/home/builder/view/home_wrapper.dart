import 'package:client/view/_product/widgets/popup/exit_popup.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../viewmodel/home_wrapper_model.dart';

class HomeWrapper extends StatefulWidget {
  const HomeWrapper({super.key});

  @override
  State<HomeWrapper> createState() => _HomeWrapperState();
}

class _HomeWrapperState extends HomeWrapperModel {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => onWillPop(context),
      child: Scaffold(
        body: PageView.builder(
          controller: pageController,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: viewList.length,
          itemBuilder: (context, index) {
            return viewList[index];
          },
        ),
        bottomNavigationBar: BottomNavigationBar(
          showUnselectedLabels: false,
          currentIndex: Provider.of<HomeProvider>(context).currentIndex,
          onTap: (value) {
            Provider.of<HomeProvider>(context, listen: false).changePage(value);
            changePage(value);
          },
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
          items: bottomNavItems,
        ),
      ),
    );
  }
}
