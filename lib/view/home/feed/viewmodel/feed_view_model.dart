import 'package:client/core/base/base_view_model.dart';
import 'package:client/view/home/feed/service/product_notifier.dart';
import 'package:client/view/home/feed/view/feed_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

abstract class FeedViewModel extends State<FeedView> with BaseViewModel {
  late final FocusNode focusNode;
  @override
  void initState() {
    super.initState();
    final products = Provider.of<ProductNotifier>(context, listen: false);
    products.fetchProducts();

    focusNode = FocusNode();
    // productList =
    //     ProductService(VexanaManager.instance.networkManager).fetchProducts();
  }

  void setFocus() {
    FocusScope.of(context).requestFocus(focusNode);
  }
}
