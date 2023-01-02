// ignore_for_file: avoid_print, must_be_immutable, depend_on_referenced_packages
import 'dart:async';
import 'package:async/async.dart';
import 'package:client/core/base/base_view_model.dart';
import 'package:client/core/constants/navigation/navigation_constants.dart';
import 'package:client/view/home/feed/cubit/search/search_cubit.dart';
import 'package:client/view/home/feed/cubit/search/search_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/extension/context_extension.dart';

class SearchAppbar extends StatefulWidget
    with PreferredSizeWidget, BaseViewModel {
  SearchAppbar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  @override
  State<SearchAppbar> createState() => _SearchAppbarState();
}

class _SearchAppbarState extends State<SearchAppbar> {
  late CancelableOperation<void> cancellableOperation;
  final _delayTime = const Duration(seconds: 1);
  String text = "";
  @override
  void initState() {
    super.initState();
    _start();
  }

  void _start() {
    cancellableOperation = CancelableOperation.fromFuture(
      Future.delayed(_delayTime),
      onCancel: () {
        print('Canceled');
      },
    );
  }

  void _onItemChanged(String value) {
    cancellableOperation.cancel();
    _start();
    cancellableOperation.value.whenComplete(() {
      setState(() {
        text = value;
      });
      print(text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchCubit, SearchState>(
      listener: (context, state) {
        if (state.isClicked == true) {
          print("Tiklandi");
        } else {
          print("Tiklanmadi");
        }
      },
      bloc: SearchCubit(),
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: context.width * 0.85,
                child: TextField(
                  onTap: () => {
                    context.read<SearchCubit>().changeIsClicked(true),
                    print(state.isClicked == true ? "Tiklandi" : "Tiklanmadi"),
                  },
                  onChanged: _onItemChanged,
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
      },
    );
  }

  Widget _buildFiltersContainer() {
    return GestureDetector(
      onTap: () {
        widget.navigation.navigateToPage(path: NavigationConstants.CATEGORY);
      },
      child: Icon(
        Icons.format_list_numbered_rtl_sharp,
        size: 30,
        color: Colors.grey[700],
      ),
    );
  }
}
