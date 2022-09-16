// ignore_for_file: file_names

import 'package:client/view/home/feed/model/product_model.dart';

abstract class IProductService {
  Future<List<Product>> getProducts();
}
