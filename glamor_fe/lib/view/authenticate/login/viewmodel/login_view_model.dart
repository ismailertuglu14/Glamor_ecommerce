// ignore_for_file: avoid_print

import 'package:client/core/base/base_view_model.dart';
import 'package:client/view/authenticate/login/view/login_view.dart';
import 'package:flutter/material.dart';

abstract class LoginViewModel extends State<LoginView> with BaseViewModel {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  String email = '';
  String password = '';

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    //focusNode.dispose();
  }
}
