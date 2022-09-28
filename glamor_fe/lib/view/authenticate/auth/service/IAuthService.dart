// ignore_for_file: file_names

import 'package:vexana/vexana.dart';

abstract class IAuthService {
  final INetworkManager manager;

  IAuthService(this.manager);

  Future<void> authUser();
}
