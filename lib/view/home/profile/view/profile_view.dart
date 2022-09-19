// ignore_for_file: non_constant_identifier_names, deprecated_member_use

import 'package:client/product/provider/user_provider.dart';
import 'package:client/view/home/profile/viewmodel/profile_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/init/cache/locale_manager.dart';

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
    final provider = Provider.of<UserProvider>(context);

    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Column(
        children: [
          ProfileCard(context),
          SettingsCard(context,
              icon: Icons.shopping_bag_outlined,
              path: '',
              title: 'Buy Packages'),

          SettingsCard(context,
              icon: Icons.privacy_tip_outlined, path: '', title: 'Privacy'),
          SettingsCard(context,
              icon: Icons.group, path: '', title: 'Help & Support'),

          // Logout Function Widget
          const Expanded(
            child: SizedBox(),
          ),
          SettingsCard(context, icon: Icons.settings, title: 'Logout',
              func: () {
            provider.setToken = '';
            LocaleManager.instance.clearAllSaveFirst();
          })
        ],
      ),
    );
  }

  Widget SettingsCard(BuildContext context,
      {required IconData icon,
      required String title,
      String? path,
      Function? func}) {
    return GestureDetector(
      onTap: () {
        path != null ? navigation.navigateToPage(path: path) : func!();
      },
      child: Card(
        child: ListTile(
          leading: Icon(icon),
          title: Text(title),
          trailing: func == null ? const Icon(Icons.arrow_forward_ios) : null,
        ),
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
