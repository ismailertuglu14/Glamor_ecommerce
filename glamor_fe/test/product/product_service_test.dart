import 'package:client/view/home/category/service/ICategoryService.dart';
import 'package:client/view/home/category/service/category_service.dart';
import 'package:client/view/home/feed/service/IProductService.dart';
import 'package:client/view/home/feed/service/product_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vexana/vexana.dart';

void main() {
  late IProductService productService;
  late ICategoryService categoryService;
  setUp(() {
    productService = ProductService(NetworkManager(
        options: BaseOptions(baseUrl: 'http://localhost:8080/api/v1')));
    categoryService = CategoryService(NetworkManager(
        options: BaseOptions(baseUrl: 'https://fakestoreapi.com/')));
  });
  test('fetch lazy products test', () async {
    final response = await productService.fetchAllProducts();
    expect(response, isNotEmpty);
  });
  test('fetch  Category test', () async {
    final response = await categoryService.fetchAllCategories();
    expect(response, isNotEmpty);
  });
  test('Get products by query', () async {
    Map<String, dynamic> newMap = {"limit": 5};
    final response = await productService.getProductsByQuery(newMap);
    expect(response, isNotNull);
  });
}
