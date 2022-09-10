import 'package:client/product/models/user_model.dart';
import 'package:client/view/authenticate/login/model/login_response_model.dart';
import 'package:flutter/cupertino.dart';

class UserProvider extends ChangeNotifier {
  UserModel user = UserModel(email: '', userName: '', userSurname: '');
  LoginResponseModel _responseModel = LoginResponseModel();
  LoginResponseModel get responseModel => _responseModel;

  void setResponseModel(LoginResponseModel model) {
    _responseModel = model;
    notifyListeners();
  }
}
