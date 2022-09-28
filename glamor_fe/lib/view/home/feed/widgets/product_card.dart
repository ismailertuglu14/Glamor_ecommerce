import 'package:client/core/constants/navigation/navigation_constants.dart';
import 'package:client/core/init/navigation/navigation_service.dart';
import 'package:client/product/extension/string_extension.dart';
import 'package:flutter/material.dart';

import '../model/product_model.dart';
import '../../../../core/extension/context_extension.dart';

class ProductCard extends StatelessWidget {
  final Product? product;
  const ProductCard({super.key, this.product});

  @override
  Widget build(BuildContext context) {
    return product == null
        ? const SizedBox.shrink()
        : buildImageInteractionCard(product!, context);
  }
}

Widget buildImageInteractionCard(Product product, BuildContext context) {
  return GestureDetector(
    onTap: () {
      NavigationService.instance.navigateToPage(
          path: NavigationConstants.PRODUCT_VIEW, data: product);
    },
    child: SizedBox(
      height: context.highValue * 3,
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
              children: const [
                // SizedBox(
                //   height: 100,
                //   child: ProjectNetworkImage(
                //     src: product.toString(),
                //   ),
                // ),
              ],
            ),
            /* Product Title*/
            Padding(
              padding: const EdgeInsets.all(16).copyWith(bottom: 0),
              child: Text(
                product.title.toString().constrict(),
                style: const TextStyle(fontSize: 16),
              ),
            ),
            /* Product Rate*/
            ButtonBar(
              alignment: MainAxisAlignment.start,
              children: [
                TextButton(
                  child: Text('${product.title}⭐'),
                  onPressed: () {},
                ),
                /* Product Price*/
                TextButton(
                  child: Text('${product.price} TL'),
                  onPressed: () {},
                )
              ],
            ),
            /* Product Seller Location */
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 5).copyWith(bottom: 5),
              child: Row(
                children: const [
                  Icon(
                    Icons.location_on_outlined,
                    size: 18,
                  ),
                  Text(
                    'TUZLA, ISTANBUL',
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
