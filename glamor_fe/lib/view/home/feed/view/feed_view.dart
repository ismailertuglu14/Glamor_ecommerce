// ignore_for_file: no_leading_underscores_for_local_identifiers, prefer_typing_uninitialized_variables, non_constant_identifier_names

import 'package:client/view/_product/widgets/close/close_keyboard.dart';
import 'package:client/view/home/feed/cubit/product/products_cubit.dart';

import 'package:client/view/home/feed/widgets/filter_modal.dart';
import 'package:client/view/home/feed/widgets/gridview_builder.dart';
import 'package:client/view/home/feed/widgets/search_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:client/core/extension/widget_extension.dart';

class FeedView extends StatefulWidget {
  const FeedView({super.key});
  @override
  State<FeedView> createState() => _FeedViewState();
}

class _FeedViewState extends State<FeedView>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return _buildScaffold();
  }

  Widget _buildScaffold() {
    return CloseKeyboard(
      widget: Padding(
        padding: context.horizontalPaddingLow,
        child: Scaffold(
          body: BlocConsumer<ProductsCubit, ProductsState>(
            listener: (context, state) {},
            builder: (context, state) {
              return NestedScrollView(
                /// This key is used to save scroll position when user navigate to other page
                /// and come back to this page again (e.g. ProductDetailPage)
                key: const PageStorageKey<String>('feed'),
                floatHeaderSlivers: true,
                headerSliverBuilder: (context, innerBoxIsScrolled) {
                  return [
                    SliverAppBar(
                      floating: true,
                      snap: true,
                      actions: [
                        SearchAppbar(),
                      ],
                    )
                  ];
                },

                /// Fetch more Products when scroll offset == 0
                body: LazyLoadScrollView(
                  scrollOffset: 0,
                  isLoading: state.isLoading ?? false,
                  onEndOfPage: () =>
                      context.read<ProductsCubit>().fetchAllProducts(),
                  child: CustomScrollView(
                    physics: const NeverScrollableScrollPhysics(),
                    slivers: [
                      SliverList(
                        delegate: SliverChildListDelegate([
                          // _buildHorizontalContainer(context),
                          const GridViewBuilder(),
                        ]),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  //! temporary Widget. It will be change to filtering icon
  Wrap _buildHorizontalContainer(context) {
    return Wrap(
      children: [
        GestureDetector(
            onTap: () => const FilterModal().show(context),
            child: const Text('Click Me')),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: const [],
          ),
        ),
      ],
    );
  }
}
