import 'package:client/core/base/base_view_model.dart';
import 'package:client/view/home/feed/view/feed_view.dart';
import 'package:flutter/material.dart';

import '../model/product_model.dart';
import '../service/product_service.dart';

abstract class FeedViewModel extends State<FeedView> with BaseViewModel {
  late final Future<List<Product>> productList;
  @override
  void initState() {
    super.initState();
    productList = ProductService().fetchProducts();
  }
}
