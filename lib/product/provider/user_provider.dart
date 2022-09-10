import 'package:client/product/models/user_model.dart';
import 'package:flutter/cupertino.dart';

class UserProvider extends ChangeNotifier {
  UserModel user = UserModel(email: '', username: '', type: 0);

  void setUserModel(UserModel model) {
    user = model;
    notifyListeners();
  }
}
