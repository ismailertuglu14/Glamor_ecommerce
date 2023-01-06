import 'dart:io';

import 'package:client/product/enums/product_serivce_enum.dart';
import 'package:client/view/home/category/models/category_model.dart';
import 'package:client/view/home/category/models/subcategory_model.dart';
import 'package:client/view/home/category/service/ICategoryService.dart';
import 'package:vexana/vexana.dart';

class CategoryService extends ICategoryService {
  CategoryService(INetworkManager networkManager) : super(networkManager);

  @override
  Future<List<Category>?> fetchAllCategories() async {
    networkManager.addBaseHeader(const MapEntry(HttpHeaders.authorizationHeader,
        'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImlzbWFpbDEyMyIsImlhdCI6MTY3MzAwNDA3MSwiZXhwIjoxNjczMDkwNDcxfQ.oNYTZHiK9d14ppAOHLbL7CJL-W_m_AzMumC8hA7lnWg'));

    final response = await networkManager.send<Category, List<Category>>(
      'category/all',
      parseModel: Category(),
      method: RequestType.GET,
    );
    return response.data;
  }

  @override
  Future<List<Subcategory>?> fetchSubcategories({required int id}) async {
    networkManager.addBaseHeader(const MapEntry(HttpHeaders.authorizationHeader,
        'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImlzbWFpbDEyMyIsImlhdCI6MTY3MzAwNDA3MSwiZXhwIjoxNjczMDkwNDcxfQ.oNYTZHiK9d14ppAOHLbL7CJL-W_m_AzMumC8hA7lnWg'));

    final response = await networkManager.send<Subcategory, List<Subcategory>>(
        '/subcategory/$id',
        parseModel: Subcategory(),
        method: RequestType.GET);
    return response.data;
  }
}
