// ignore_for_file: prefer_initializing_formals

import 'package:vexana/vexana.dart';

abstract class ICategoryService {
  late final INetworkManager networkManager;
  ICategoryService(INetworkManager networkManager)
      : networkManager = networkManager;
  Future<List<String>?> fetchAllCategories();
}
