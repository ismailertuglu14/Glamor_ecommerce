// ignore_for_file: avoid_print

import 'package:client/core/base/base_view_model.dart';
import 'package:client/core/constants/navigation/navigation_constants.dart';
import 'package:client/core/init/network/vexana_manager.dart';
import 'package:client/product/provider/user_provider.dart';
import 'package:client/view/authenticate/login/model/login_model.dart';
import 'package:client/view/authenticate/login/service/ILoginService.dart';
import 'package:client/view/authenticate/login/view/login_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/enums/locale_keys_enum.dart';
import '../../../../core/init/cache/locale_manager.dart';
import '../service/login_service.dart';

abstract class LoginViewModel extends State<LoginView> with BaseViewModel {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  late final FocusNode focusNode;
  late ILoginService loginService;
  String email = '';
  String password = '';
  bool isLoading = false;
  @override
  BuildContext get context => super.context;
  late UserProvider userProvider;
  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();
    loginService = LoginService(VexanaManager.instance.networkManager);
    userProvider = Provider.of<UserProvider>(context, listen: false);
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    focusNode.dispose();
  }

  void changeIsLoading() {
    isLoading = !isLoading;
    setState(() {});
  }

  Future<void> fetchLoginService() async {
    changeIsLoading();
    if (formKey.currentState!.validate()) {
      final response = await loginService.fetchUser(LoginModel(
          email: emailController.text, password: passwordController.text));

      print('adasdsadsa');
      if (response != null) {
        await LocaleManager.instance
            .setStringValue(PreferencesKeys.TOKEN, response.token!);
        print(response);
        //  navigation.navigateToPageClear(path: NavigationConstants.TEST_VIEW);
      }
    }
    changeIsLoading();
  }

  void setFocus() {
    FocusScope.of(context).requestFocus(focusNode);
  }
}
