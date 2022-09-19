import 'package:cached_network_image/cached_network_image.dart';
import 'package:client/core/constants/navigation/navigation_constants.dart';
import 'package:client/core/init/navigation/navigation_service.dart';
import 'package:client/product/extension/string_extension.dart';
import 'package:flutter/material.dart';

import '../../../home/feed/model/product_model.dart';

class ProductCard extends StatefulWidget {
  final Product? product;
  const ProductCard({super.key, this.product});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return buildImageInteractionCard(context);
  }

  Widget buildImageInteractionCard(BuildContext context) {
    return GestureDetector(
      onTap: () {
        NavigationService.instance.navigateToPage(
            path: NavigationConstants.PRODUCT_VIEW, data: widget.product);
      },
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            /* Product Image*/
            Stack(
              children: [
                SizedBox(
                  height: 100,
                  child: CachedNetworkImage(
                    key: UniqueKey(),
                    imageUrl: widget.product!.image.toString(),
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
            /* Product Title*/
            Padding(
              padding: const EdgeInsets.all(16).copyWith(bottom: 0),
              child: Text(
                widget.product!.title.toString().constrict(),
                style: const TextStyle(fontSize: 16),
              ),
            ),
            /* Product Rate*/
            ButtonBar(
              alignment: MainAxisAlignment.start,
              children: [
                TextButton(
                  child: Text('${widget.product!.rating!.rate}⭐'),
                  onPressed: () {},
                ),
                /* Product Price*/
                TextButton(
                  child: Text('${widget.product!.price} TL'),
                  onPressed: () {},
                )
              ],
            ),
            /* Product Seller Location */
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.location_on_outlined),
                  const Text('TUZLA, ISTANBUL'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
