import 'package:vexana/vexana.dart';

class VexanaManager {
  static VexanaManager? _instace;
  static VexanaManager get instance {
    if (_instace != null) return _instace!;
    _instace = VexanaManager._init();
    return _instace!;
  }

  static const String _baseUrl = 'https://multi-grocery.herokuapp.com/api';

  VexanaManager._init();

  INetworkManager networkManager = NetworkManager(
      isEnableLogger: true, options: BaseOptions(baseUrl: _baseUrl));
}
