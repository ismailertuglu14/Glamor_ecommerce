// ignore_for_file: avoid_print

import 'package:client/core/extension/context_extension.dart';
import 'package:client/core/extension/string_extension.dart';
import 'package:client/product/utility/custom_padding.dart';
import 'package:client/view/home/feed/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class ProductView extends StatefulWidget {
  final Product product;
  const ProductView({super.key, required this.product});
  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  @override
  Widget build(BuildContext context) {
    return _buildScaffold();
  }

  Scaffold _buildScaffold() {
    return Scaffold(
      body: Container(
        margin: const CustomPadding.paddingTopHigh(),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildImageSlideShow(),
              _buildTitle(),
              _buildDescription()
              //? _buildSellerCard(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  Widget _buildImageSlideShow() {
    return ImageSlideshow(
      width: context.width,
      height: context.veryHighValue,
      children: [
        Image.asset('assets/mock/product/mac1.jpeg', fit: BoxFit.fill),
        Image.asset('assets/mock/product/mac1.jpeg', fit: BoxFit.fill),
        Image.asset('assets/mock/product/mac1.jpeg', fit: BoxFit.fill),
        Image.asset('assets/mock/product/mac1.jpeg', fit: BoxFit.fill),
      ],
    );
  }

  Widget _buildTitle() {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, left: 12),
      child: Text(
        '${widget.product.title}',
        style: TextStyle(
            color: Theme.of(context).colorScheme.primary,
            fontSize: Theme.of(context).textTheme.titleLarge!.fontSize,
            fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildDescription() {
    /// isNull is my extension for [String?].
    /// Check more information String extensions under core/extensions folder
    return Padding(
      padding: const EdgeInsets.only(top: 12, left: 12),
      child: Text(
        widget.product.description.isNull,
        style: TextStyle(
            color: Theme.of(context).colorScheme.primary,
            fontSize: Theme.of(context).textTheme.titleSmall!.fontSize,
            fontWeight: FontWeight.w400),
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
