import 'dart:convert';

import 'package:client/view/home/feed/service/IProductService.dart';
import 'package:vexana/vexana.dart';

import '../model/product_model.dart';
import 'package:http/http.dart' as http;

class ProductService extends IProductService {
  static ProductService? _instance;

  ProductService._();

  static ProductService get instance {
    return _instance ??= ProductService._();
  }

  @override
  Future<List<Product>> getProducts() async {
    final getProducts = await http
        .get(Uri.parse('https://fakestoreapi.com/products'), headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    });
    final List responseBody = jsonDecode(getProducts.body);

    return responseBody.map((e) => Product.fromJson(e)).toList();
  }
}
