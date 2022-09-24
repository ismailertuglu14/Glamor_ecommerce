import 'package:client/view/_product/query/product_queries.dart';
import 'package:client/view/home/feed/model/product_model.dart';
import 'package:client/view/home/feed/service/IProductService.dart';
import 'package:vexana/vexana.dart';

class ProductService extends IProductService {
  ProductService(INetworkManager networkManager) : super(networkManager);

  @override
  Future<List<Product>?> fetchAllProducts({int count = 5}) async {
    final response = await networkManager.send<Product, List<Product>>(
      ProductServicePath.products.name,
      parseModel: Product(),
      method: RequestType.GET,
      queryParameters:
          Map.fromEntries([ProductQueries.limit.toMapEntry('$count')]),
    );

    return response.data;
  }
}
