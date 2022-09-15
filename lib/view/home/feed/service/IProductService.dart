import 'package:client/view/home/feed/model/product_model.dart';

abstract class IProductService {
  Future<List<Product>> getProducts();
}
