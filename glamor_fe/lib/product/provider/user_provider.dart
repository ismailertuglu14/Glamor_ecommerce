// ignore_for_file: avoid_print

import 'package:client/core/constants/enums/locale_keys_enum.dart';
import 'package:client/core/init/cache/locale_manager.dart';
import 'package:client/product/models/user_model.dart';
import 'package:flutter/cupertino.dart';

class UserProvider with ChangeNotifier {
  String? _token;
  String? get token => _token;
  set setToken(String? value) {
    _token = value;
    notifyListeners();
  }

  UserModel user = UserModel(email: '', username: '', type: 0);

  void setUserModel(Map<String, dynamic> model) {
    user = UserModel.fromJson(model);
    notifyListeners();
  }

  getToken() {
    String? value = LocaleManager.instance.getStringValue(PreferencesKeys
        .TOKEN); // Locale de kayıtlı olan token değerini getirecek.
    setToken = value;
  }
}
