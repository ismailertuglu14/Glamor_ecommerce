// ignore_for_file: non_constant_identifier_names, deprecated_member_use

import 'package:client/core/constants/app/app_constants.dart';
import 'package:client/core/init/language/locale_keys.g.dart';
import 'package:client/product/provider/user_provider.dart';
import 'package:client/view/home/profile/viewmodel/profile_view_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/navigation/navigation_constants.dart';
import '../../../../core/init/cache/locale_manager.dart';
import '../widgets/profile_card.dart';

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
        title: const Text(AppConstants.APP_NAME),
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
          const ProfileCard(),
          SettingsCard(
              icon: Icons.shopping_bag_outlined,
              path: '',
              title: 'Buy Packages',
              tooltip: 'Packages'),

          SettingsCard(
            icon: Icons.privacy_tip_outlined,
            path: '',
            title: 'Privacy',
          ),
          SettingsCard(
            icon: Icons.group,
            path: '',
            title: 'Help & Support',
          ),
          SettingsCard(
            icon: Icons.settings,
            path: NavigationConstants.APP_SETTINGS,
            title: 'App Settings',
          ),

          // Logout Function Widget
          const Expanded(
            child: SizedBox(),
          ),
          SettingsCard(
              icon: Icons.logout,
              title: 'Logout',
              func: () {
                provider.setToken = '';
                LocaleManager.instance.clearAllSaveFirst();
              })
        ],
      ),
    );
  }

  Widget SettingsCard({
    required IconData icon,
    required String title,
    String? tooltip,
    String? path,
    Function? func,
  }) {
    return GestureDetector(
      onTap: () {
        path != null ? navigation.navigateToPage(path: path) : func!();
      },
      child: Card(
        child: ListTile(
          leading: Icon(icon),
          title: Text(title),
          trailing: func == null
              ? IconButton(
                  onPressed: () {},
                  tooltip: tooltip ?? title,
                  icon: const Icon(Icons.arrow_forward_ios),
                )
              : null,
        ),
      ),
    );
  }
}
