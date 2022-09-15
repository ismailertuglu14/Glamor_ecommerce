import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../home/feed/model/product_model.dart';

class ProductCard extends StatelessWidget {
  final Product? product;
  const ProductCard({super.key, this.product});

  @override
  Widget build(BuildContext context) {
    return buildImageInteractionCard();
  }

  Widget buildImageInteractionCard() => Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            /* Product Image*/
            Stack(
              children: [
                SizedBox(
                  height: 150,
                  child: CachedNetworkImage(
                    key: UniqueKey(),
                    imageUrl: product!.image.toString(),
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
            /* Product Title*/
            Padding(
              padding: const EdgeInsets.all(16).copyWith(bottom: 0),
              child: Text(
                product!.title.toString(),
                style: const TextStyle(fontSize: 16),
              ),
            ),
            /* Product Rate*/
            ButtonBar(
              alignment: MainAxisAlignment.start,
              children: [
                TextButton(
                  child: Text('${product!.rating!.rate}⭐'),
                  onPressed: () {},
                ),
                /* Product Price*/
                TextButton(
                  child: Text('${product!.price} TL'),
                  onPressed: () {},
                )
              ],
            ),
            /* Product Seller Location */
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              child: Row(
                children: const [
                  Icon(Icons.location_on_outlined),
                  Text('TUZLA, ISTANBUL'),
                ],
              ),
            ),
          ],
        ),
      );
}
