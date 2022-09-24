import 'package:client/core/constants/app/app_constants.dart';
import 'package:vexana/vexana.dart';

class ProductNetworkManager extends NetworkManager {
  ProductNetworkManager()
      : super(options: BaseOptions(baseUrl: AppConstants.instance.baseUrl));
}
