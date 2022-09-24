import 'package:client/core/constants/enums/locale_keys_enum.dart';
import 'package:client/core/init/cache/locale_manager.dart';
import 'package:client/product/provider/user_provider.dart';
import 'package:client/view/authenticate/login/model/login_response_model.dart';
import 'package:client/view/authenticate/login/model/login_model.dart';
import 'package:client/view/authenticate/login/service/ILoginService.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:vexana/vexana.dart';

import '../../../../product/provider/user_provider.dart';

class LoginService extends ILoginService {
  LoginService(INetworkManager manager) : super(manager);

  @override
  Future<LoginResponseModel?> fetchUser(
      LoginModel model, BuildContext? context) async {
    final response = await manager.send<LoginResponseModel, LoginResponseModel>(
        '/auth/login',
        parseModel: LoginResponseModel(),
        method: RequestType.POST,
        data: model);

    if (response.data is LoginResponseModel) {
      final userProvider = Provider.of<UserProvider>(context!, listen: false);
      userProvider.setToken = response.data!.token;
      await LocaleManager.instance.setStringValue(
          PreferencesKeys.TOKEN, response.data!.token.toString());
      return response.data;
    } else {
      return null;
    }
  }
}
