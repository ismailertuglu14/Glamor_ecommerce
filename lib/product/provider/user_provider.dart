// ignore_for_file: avoid_print

import 'package:client/core/constants/enums/locale_keys_enum.dart';
import 'package:client/core/init/cache/locale_manager.dart';
import 'package:client/product/models/user_model.dart';
import 'package:flutter/cupertino.dart';

class UserProvider extends ChangeNotifier {
  String? token;

  UserModel user = UserModel(email: '', username: '', type: 0);

  void setUserModel(Map<String, dynamic> model) {
    user = UserModel.fromJson(model);
    notifyListeners();
  }

  String? getToken() {
    token = LocaleManager.instance.getStringValue(PreferencesKeys.TOKEN);
    print('Get Token metod executed => ${token!}');
    return token;
  }
}
