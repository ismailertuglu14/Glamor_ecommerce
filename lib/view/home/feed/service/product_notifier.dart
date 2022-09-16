import 'package:client/view/home/feed/model/product_model.dart';
import 'package:client/view/home/feed/service/product_service.dart';
import 'package:flutter/widgets.dart';

class ProductNotifier extends ChangeNotifier {
  List<Product> productList = [];

  Future<void> fetchProducts() async {
    try {
      final apiProducts = await ProductService.instance.getProducts();
      productList = apiProducts;
      notifyListeners();
    } catch (e) {
      throw e.toString();
    }
  }
}
