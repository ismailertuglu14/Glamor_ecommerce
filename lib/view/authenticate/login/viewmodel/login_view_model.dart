// ignore_for_file: avoid_print

import 'package:client/core/init/network/vexana_manager.dart';
import 'package:client/view/authenticate/login/model/login_model.dart';
import 'package:client/view/authenticate/login/service/ILoginService.dart';
import 'package:client/view/authenticate/login/view/login_view.dart';
import 'package:flutter/material.dart';

import '../service/login_service.dart';

abstract class LoginViewModel extends State<LoginView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  late final FocusNode focusNode;
  late ILoginService loginService;
  String email = '';
  String password = '';
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();
    loginService = LoginService(VexanaManager.instance.networkManager);
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    focusNode.dispose();
    formKey.currentState!.dispose();
  }

  void changeIsLoading() {
    isLoading = !isLoading;
  }

  Future<void> fetchLoginService() async {
    changeIsLoading();
    if (formKey.currentState!.validate()) {
      final response = await loginService.fetchUser(LoginModel(
          email: emailController.text, password: passwordController.text));
      // print(response.success);
      //  print(emailController.text + passwordController.text);
      print('adasdsadsa');
      if (response != null) {
        print('Response null değil');
        print(response.token);
        /*  await LocaleManager.instance
            .setStringValue(PreferencesKeys.TOKEN, response.token!);
      */
      }
    }
    changeIsLoading();
  }

  void setFocus() {
    FocusScope.of(context).requestFocus(focusNode);
  }
}
