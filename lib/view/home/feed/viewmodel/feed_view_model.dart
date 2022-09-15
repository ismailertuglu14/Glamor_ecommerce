import 'package:client/core/base/base_view_model.dart';
import 'package:client/core/init/network/vexana_manager.dart';
import 'package:client/view/home/feed/service/product_notifier.dart';
import 'package:client/view/home/feed/view/feed_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/product_model.dart';

abstract class FeedViewModel extends State<FeedView> with BaseViewModel {
  @override
  void initState() {
    super.initState();
    final products = Provider.of<ProductNotifier>(context, listen: false);
    products.fetchProducts();
    // productList =
    //     ProductService(VexanaManager.instance.networkManager).fetchProducts();
  }
}
