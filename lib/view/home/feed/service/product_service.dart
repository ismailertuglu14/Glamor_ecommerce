import 'package:client/view/home/feed/model/product_model.dart';
import 'package:dio/dio.dart';

class ProductService {
  Dio dio = Dio(BaseOptions(baseUrl: 'https://fakestoreapi.com/products'));
  Future<List<Product>> fetchProducts() async {
    var response = await dio.get('/');
    List<Product> productList = [];

    if (response.data is List) {
      (response.data as List)
          .map((e) => productList.add(Product.fromJson(e)))
          .toList();
    }

    return productList;
  }
}
