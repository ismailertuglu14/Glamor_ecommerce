import 'package:client/core/constants/navigation/navigation_constants.dart';
import 'package:client/core/init/navigation/navigation_service.dart';
import 'package:client/core/extension/string_extension.dart';
import 'package:client/product/utility/image/project_network_image.dart';
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
    child: Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          /* Product Image*/
          SizedBox(
            height: context.highValue * 1.5,
            width: double.infinity,
            child: Image.network("http://localhost:5757/${product.coverImage}"),
            // Image.asset('assets/mock/product/mac1.jpeg')
            // child: ProjectNetworkImage(
            //   src:
            //       'https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/macbook-air-space-gray-config-201810?wid=1078&hei=624&fmt=jpeg&qlt=90&.v=1664499515473',
            //   //'https://pbs.twimg.com/profile_images/949787136030539782/LnRrYf6e_400x400.jpg',
            // ),
          ),

          /* Product Title*/
          Padding(
            padding: const EdgeInsets.all(16).copyWith(bottom: 0),
            child: Text(
              product.title.toString().constrict(),
              style: const TextStyle(fontSize: 16),
            ),
          ),

          /* Product Seller Location */
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 10).copyWith(bottom: 5),
            child: Row(
              children: [
                const Icon(
                  Icons.location_on_outlined,
                  size: 18,
                ),
                const Text(
                  'Istanbul',
                  style: TextStyle(fontSize: 12),
                ),
                const Expanded(child: SizedBox()),
                Text('${product.price} TL'),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
