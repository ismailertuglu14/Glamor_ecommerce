// ignore_for_file: non_constant_identifier_names, deprecated_member_use

import 'package:client/view/home/profile/viewmodel/profile_view_model.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});
  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends ProfileViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CartDropper'),
        centerTitle: true,
        elevation: 1,
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
      body: _buildBody(context),
    );
  }

  Padding _buildBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Column(
        children: [
          ProfileCard(context),
        ],
      ),
    );
  }

/* Widgets*/
  Card ProfileCard(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const CircleAvatar(
          backgroundImage: NetworkImage(
              'https://lh3.googleusercontent.com/ogw/AOh-ky0FbHqdSwVlRuYrWf-hkvNJkDfbMnenWPJcrge6YQ=s32-c-mo'),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('İsmail Ertuglu'),
            Text(
              'ismailertgl@gmail.com',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Theme.of(context).colorScheme.primaryVariant),
            ),
          ],
        ),
        trailing: const Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}
