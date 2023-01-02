import 'package:vexana/vexana.dart';

class VexanaManager {
  static VexanaManager? _instace;
  static VexanaManager get instance {
    if (_instace != null) return _instace!;
    _instace = VexanaManager._init();
    return _instace!;
  }

  static const String _baseUrl = 'http://127.0.0.1:8080/api/v1/';
  VexanaManager._init();

  INetworkManager networkManager = NetworkManager(
    isEnableLogger: true,
    options: BaseOptions(baseUrl: _baseUrl),
  );
}
