// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:client/product/utility/grid_util.dart';
import 'package:client/view/home/feed/cubit/product/products_cubit.dart';

import 'package:client/view/home/feed/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';

class GridViewBuilder extends StatelessWidget {
  const GridViewBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    int _value = 200;

    /// Padding between 2 product card in a [Vertical plane], you can change padding by changing [_value];
    final double itemHeight = (size.height - kToolbarHeight - _value) / 2;
    final double itemWidth = size.width / 2;

    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        return GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: FeedGridDelegate(width: itemWidth, height: itemHeight),
          itemCount: state.products?.length ?? 0,
          itemBuilder: (context, index) {
            return ProductCard(product: state.products?[index]);
          },
        );
      },
    );
  }
}
