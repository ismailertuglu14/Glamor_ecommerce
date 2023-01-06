// ignore_for_file: prefer_initializing_formals, file_names

import 'package:client/view/home/category/models/category_model.dart';
import 'package:client/view/home/category/models/subcategory_model.dart';
import 'package:vexana/vexana.dart';

abstract class ICategoryService {
  late final INetworkManager networkManager;
  ICategoryService(INetworkManager networkManager)
      : networkManager = networkManager;
  Future<List<Category>?> fetchAllCategories();
  Future<List<Subcategory>?> fetchSubcategories({required int id});
}
