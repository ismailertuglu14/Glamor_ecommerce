import 'package:client/product/utility/duration_items.dart';
import 'package:client/view/home/profile/widgets/user_circle_avatar.dart';
import 'package:flutter/material.dart';

import '../viewmodel/profile_detail_view_model.dart';

class ProfileDetailView extends StatefulWidget {
  const ProfileDetailView({super.key});

  @override
  State<ProfileDetailView> createState() => _ProfileDetailViewState();
}

class _ProfileDetailViewState extends ProfileDetailViewModel {
  final String _userName = 'İsmail Ertuglu';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(children: [
        Expanded(
          flex: 2,
          child: Row(
            children: [
              const Expanded(flex: 3, child: UserCircleAvatar()),
              Expanded(
                flex: 7,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(_userName,
                        style: Theme.of(context).textTheme.headline4!.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.primary)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Icon(Icons.star),
                        Icon(Icons.star),
                        Icon(Icons.star),
                        Icon(Icons.star),
                        Icon(Icons.star_half_rounded),
                        Text("126 Reviews")
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: TextButton.icon(
                                onPressed: () {},
                                icon: const Icon(Icons.heart_broken_sharp),
                                label: const Text('265 Follow'))),
                        Expanded(
                            child: TextButton.icon(
                                onPressed: () {},
                                icon: const Icon(Icons.follow_the_signs),
                                label: const Text('80 Followers'))),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: TabBar(
              onTap: (value) => pageController.animateToPage(value,
                  duration: DurationItems.durationLow(),
                  curve: Curves.easeInOut),
              controller: tabController,
              tabs: const [
                Tab(text: 'My Products'),
                Tab(text: 'My Bought'),
                Tab(text: 'My Favorites'),
              ]),
        ),
        Expanded(
          flex: 6,
          child: PageView(
              controller: pageController,
              physics: const BouncingScrollPhysics(),
              onPageChanged: (value) => tabController.animateTo(value),
              children: const [
                Center(child: Text('My Products')),
                Center(child: Text('My Bought')),
                Center(child: Text('My Favorites')),
              ]),
        ),
      ]),
    );
  }
}
