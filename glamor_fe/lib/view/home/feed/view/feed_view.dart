// ignore_for_file: no_leading_underscores_for_local_identifiers, prefer_typing_uninitialized_variables

import 'package:client/core/base/base_view_model.dart';
import 'package:client/core/constants/navigation/navigation_constants.dart';
import 'package:client/view/_product/widgets/close/close_keyboard.dart';
import 'package:client/view/home/feed/cubit/products_cubit.dart';
import 'package:client/view/home/feed/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';

class FeedView extends StatefulWidget {
  const FeedView({super.key});
  @override
  State<FeedView> createState() => _FeedViewState();
}

class _FeedViewState extends State<FeedView> with BaseViewModel {
  late final ScrollController _scrollController;
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _listenScroll(context);
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  void _listenScroll(BuildContext context) {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels + 40 >
          _scrollController.position.maxScrollExtent) {
        context.read<ProductsCubit>().fetchNewProducts();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _buildBody());
  }

  Widget _buildBody() {
    return CloseKeyboard(
      widget: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 8)
            .copyWith(bottom: 1),
        child: BlocConsumer<ProductsCubit, ProductsState>(
          listener: (context, state) {
            if (state.isInitial) {
              _listenScroll(context);
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
              controller: _scrollController,
              key: const PageStorageKey<String>('feed'),
              child: Column(
                children: [
                  _buildTextField(),
                  _buildFiltersContainer(),
                  _buildHorizontalContainer(),
                  _buildItemList(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildItemList() {
    var size = MediaQuery.of(context).size;
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
          itemBuilder: (context, index) {
            return Column(
              children: [
                ProductCard(product: state.products?[index]),
                state.products.isNotNullOrEmpty &&
                        index == state.products!.length - 1
                    ? const SizedBox.shrink() //Loading
                    : const SizedBox.shrink()
              ],
            );
          },
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
