import 'package:client/product/enums/product_serivce_enum.dart';
import 'package:client/view/home/feed/model/product_model.dart';
import 'package:client/view/home/feed/service/IProductService.dart';
import 'package:vexana/vexana.dart';

class ProductService extends IProductService {
  ProductService(INetworkManager networkManager) : super(networkManager);
  @override
  Future<List<Product>?> fetchAllProducts({int count = 6}) async {
    final response = await networkManager.send<Product, List<Product>>(
      '/product/all',

      // ProductServicePath.products.name,
      parseModel: Product(),
      method: RequestType.GET,

      // queryParameters:
      //     Map.fromEntries([ProductQueries.limit.toMapEntry('$count')]),
    );

    return response.data;
  }

  @override
  Future<List<Product>?> getProductsByQuery(
      Map<String, dynamic> queries) async {
    final response = await networkManager.send<Product, List<Product>>(
        ProductServicePath.products.name,
        parseModel: Product(),
        method: RequestType.GET,
        queryParameters: queries);

    return response.data;
  }
}
