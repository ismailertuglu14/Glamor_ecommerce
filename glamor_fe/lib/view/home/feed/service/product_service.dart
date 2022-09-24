// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';

import 'package:client/core/init/network/vexana_manager.dart';
import 'package:client/view/home/feed/service/IProductService.dart';

import '../model/product_model.dart';
import 'package:http/http.dart' as http;

class ProductService extends IProductService {
  static ProductService? _instance;

  ProductService._() : super(VexanaManager.instance.networkManager);

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

  @override
  Future<List<Product>?> fetchAllProducts({int count = 5}) {
    // TODO: implement fetchAllProducts
    throw UnimplementedError();
  }
}
