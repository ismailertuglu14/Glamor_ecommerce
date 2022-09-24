import 'package:client/view/home/feed/service/IProductService.dart';
import 'package:client/view/home/feed/service/product_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vexana/vexana.dart';

void main() {
  late IProductService productService;
  setUp(() {
    productService = ProductService(NetworkManager(
        options: BaseOptions(baseUrl: 'https://fakestoreapi.com/')));
  });
  test('fetch lazy products test', () async {
    final response = await productService.fetchAllProducts();
    expect(response, isNotEmpty);
  });
  test('fetch  Category test', () async {
    final response = await productService.fetchAllCategories();
    expect(response, isNotEmpty);
  });
}
