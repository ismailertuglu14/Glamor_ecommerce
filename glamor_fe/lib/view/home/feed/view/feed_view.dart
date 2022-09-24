// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:client/core/base/base_view_model.dart';
import 'package:client/core/constants/navigation/navigation_constants.dart';
import 'package:client/view/_product/widgets/close/close_keyboard.dart';
import 'package:client/view/home/feed/cubit/products_cubit.dart';
import 'package:client/view/home/feed/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeedView extends StatefulWidget {
  const FeedView({super.key});
  @override
  State<FeedView> createState() => _FeedViewState();
}

class _FeedViewState extends State<FeedView> with BaseViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return CloseKeyboard(
      widget: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 8)
            .copyWith(bottom: 1),
        child: SingleChildScrollView(
          key: const PageStorageKey<String>('feed'),
          child: Column(
            children: [
              _buildTextField(),
              _buildFiltersContainer(),
              _buildHorizontalContainer(),
              _buildItemList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildItemList() {
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 100) / 2;
    final double itemWidth = size.width / 2;
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        return GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            crossAxisCount: 2,
            childAspectRatio: (itemWidth / itemHeight),
          ),
          itemCount: state.products?.length ?? 0,
          itemBuilder: (context, index) =>
              ProductCard(product: state.products?[index]),
        );
      },
    );
  }

  Widget _buildFiltersContainer() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          GestureDetector(
            onTap: () {
              navigation.navigateToPage(path: NavigationConstants.CATEGORY);
            },
            child: const Icon(Icons.format_list_numbered_rtl_sharp),
          ),
        ],
      ),
    );
  }

  Wrap _buildHorizontalContainer() {
    return Wrap(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: const [],
          ),
        ),
      ],
    );
  }

  TextField _buildTextField() {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Search',
        hintStyle: const TextStyle(letterSpacing: 3),
        suffixIcon: GestureDetector(
          onTap: () {
            //TODO: Clear text stuffs
          },
          child: const Icon(Icons.close),
        ),
      ),
    );
  }

/*   Widget _buildProductLoading() {
    return BlocSelector<ProductsCubit, ProductsState, bool>(
      selector: (state) {
        return state.isLoading ?? false;
      },
      builder: (context, state) {
        return AnimatedOpacity(
          opacity: state ? 1 : 0,
          duration: context.durationLow,
          child: const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
   */
}
