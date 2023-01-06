import 'dart:io';

import 'package:vexana/vexana.dart';

class VexanaManager {
  static VexanaManager? _instace;
  static VexanaManager get instance {
    if (_instace != null) return _instace!;
    _instace = VexanaManager._init();
    return _instace!;
  }

  VexanaManager._init();

  static const String _baseUrl = 'http://127.0.0.1:5757/api/';

  INetworkManager networkManager = NetworkManager(
    isEnableLogger: true,
    options: BaseOptions(baseUrl: _baseUrl, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    }),
  );
}
