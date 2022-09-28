// ignore_for_file: avoid_print, must_be_immutable

import 'package:client/core/base/base_view_model.dart';
import 'package:client/core/constants/navigation/navigation_constants.dart';
import 'package:flutter/material.dart';
import '../../../../core/extension/context_extension.dart';

class SearchAppbar extends StatelessWidget
    with PreferredSizeWidget, BaseViewModel {
  SearchAppbar({super.key});

  @override
  // todo: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: context.width * 0.85,
            child: TextField(
              onEditingComplete: () {
                // todo: Close Keyboard, Clear products List, Set Product with query which is coming from textfield value
                print('On edit completed! New logic will be calling here!');
              },
              decoration: InputDecoration(
                hintText: 'Search product, brand, user, #hashtag',
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.green,
                ),
                hintStyle: const TextStyle(fontSize: 14),
                suffixIcon: GestureDetector(
                  onTap: () {
                    //todo: Clear text stuffs
                  },
                  child: const Icon(Icons.close),
                ),
              ),
            ),
          ),
          const SizedBox(width: 5),
          _buildFiltersContainer(),
        ],
      ),
    );
  }

  Widget _buildFiltersContainer() {
    return GestureDetector(
      onTap: () {
        navigation.navigateToPage(path: NavigationConstants.CATEGORY);
      },
      child: Icon(
        Icons.format_list_numbered_rtl_sharp,
        size: 30,
        color: Colors.grey[700],
      ),
    );
  }
}
