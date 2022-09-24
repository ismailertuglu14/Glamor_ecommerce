// ignore_for_file: file_names

import 'package:client/view/home/feed/model/product_model.dart';
import 'package:client/view/_product/query/product_queries.dart';
import 'package:vexana/vexana.dart';

abstract class IProductService {
  late final INetworkManager _networkManager;
  IProductService(INetworkManager networkManager)
      : _networkManager = networkManager;

  Future<List<Product>?> fetchAllProducts({int count = 5});
  //Future<List<Product>> getProductByQuery(String query);

}

class ProductService extends IProductService {
  ProductService(INetworkManager networkManager) : super(networkManager);

  @override
  Future<List<Product>?> fetchAllProducts({int count = 5}) async {
    final response = await _networkManager.send<Product, List<Product>>(
      _ProductServicePath.products.name,
      parseModel: Product(),
      method: RequestType.GET,
      queryParameters:
          Map.fromEntries([ProductQueries.limit.toMapEntry('$count')]),
    );

    return response.data;
  }
}

enum _ProductServicePath { products }
