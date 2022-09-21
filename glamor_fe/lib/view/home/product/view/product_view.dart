// ignore_for_file: avoid_print

import 'package:client/view/home/feed/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

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
    return _buildScaffold();
  }

  Scaffold _buildScaffold() {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
        child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildImageSlideShow(),
              _buildTitle(),
              //? _buildSellerCard(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  Widget _buildImageSlideShow() {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height / 3;
    return Container(
      color: Colors.red,
      child: ImageSlideshow(
        width: width,
        height: height,
        children: [
          //! Temporary method
          Image.network(
            widget.product.image.toString(),
            fit: BoxFit.fill,
          ),
          Image.network(
            widget.product.image.toString(),
            fit: BoxFit.fill,
          ),
          Image.network(
            widget.product.image.toString(),
            fit: BoxFit.fill,
          ),
          Image.network(
            widget.product.image.toString(),
            fit: BoxFit.fill,
          ),
        ],
      ),
    );
  }

  Widget _buildTitle() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
      child: Text(
        '${widget.product.title}',
        style: TextStyle(
            color: Theme.of(context).colorScheme.primary,
            fontSize: Theme.of(context).textTheme.titleSmall!.fontSize,
            fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildBottomNavBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      color: Colors.green,
      height: 70,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '${widget.product.price} TL',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          InkWell(
            onTap: () {
              print('Clicked to message button');
            },
            child: const Text('Message'),
          ),
          InkWell(
            onTap: () {
              print('Clicked to Favorite button');
            },
            child: const Text('Add to Favorites'),
          )
        ],
      ),
    );
  }
}
