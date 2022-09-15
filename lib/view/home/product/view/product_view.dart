import 'package:cached_network_image/cached_network_image.dart';
import 'package:client/view/home/feed/model/product_model.dart';
import 'package:flutter/material.dart';

import '../viewmodel/product_view_model.dart';

class ProductView extends StatefulWidget {
  final Product product;
  const ProductView({super.key, required this.product});
  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends ProductViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 200,
              child: CachedNetworkImage(
                imageUrl: widget.product.image.toString(),
              ),
            ),
            Text('${widget.product.title}'),
          ],
        ),
      ),
    );
  }
}
