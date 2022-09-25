import 'package:client/product/enums/product_serivce_enum.dart';
import 'package:client/view/home/category/service/ICategoryService.dart';
import 'package:vexana/vexana.dart';

class CategoryService extends ICategoryService {
  CategoryService(INetworkManager networkManager) : super(networkManager);
  @override
  Future<List<String>?> fetchAllCategories() async {
    final response = await networkManager.sendPrimitive(
        '${ProductServicePath.products.name}/${ProductServicePath.categories.name}');

    return response is List ? response.map((e) => '$e').toList() : null;
  }
}
