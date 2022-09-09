import 'package:client/view/authenticate/login/view/login_view.dart';
import 'package:flutter/material.dart';

abstract class LoginViewModel extends State<LoginView> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }
}
