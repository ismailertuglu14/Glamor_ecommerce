// ignore_for_file: file_names, prefer_initializing_formals

import 'package:client/view/home/feed/model/product_model.dart';
import 'package:vexana/vexana.dart';

abstract class IProductService {
  late final INetworkManager networkManager;
  IProductService(INetworkManager networkManager)
      : networkManager = networkManager;

  Future<List<Product>?> fetchAllProducts({int count = 5});
  //Future<List<Product>> getProductByQuery(String query);

}
