import 'package:client/view/_product/widgets/card/product_card.dart';
import 'package:client/view/home/feed/model/product_model.dart';
import 'package:client/view/home/feed/viewmodel/feed_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class FeedView extends StatefulWidget {
  const FeedView({super.key});
  @override
  State<FeedView> createState() => _FeedViewState();
}

class _FeedViewState extends FeedViewModel {
  @override
  Widget build(BuildContext context) {
    return _buildScaffold();
  }

  Scaffold _buildScaffold() {
    return Scaffold(
      body: FutureBuilder<List<Product>>(
        future: productList,
        builder: ((context, snapshot) {
          if (!snapshot.hasData) {
            return _buildProductLoading();
          } else if (snapshot.hasData) {
            var list = snapshot.data;
            return _buildProductList(list!);
          } else {
            return _buildProductError();
          }
        }),
      ),
    );
  }

  Center _buildProductLoading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildProductList(List<Product> list) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 4),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const TextField(
              decoration: InputDecoration(hintText: 'Search'),
            ),
            MasonryGridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: const EdgeInsets.only(top: 20),
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              itemCount: list.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    // NavigationService.instance.navigateToPage(
                    //     path: NavigationConstants.HOME_VIEW);
                  },
                  child: ProductCard(
                    product: list[index],
                  ),
                );
              },
              gridDelegate:
                  const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
            ),
          ],
        ),
      ),
    );
  }

  Center _buildProductError() {
    return const Center(
      child: Text('Some error occured while getting products!'),
    );
  }
}
