import 'package:client/core/base/base_view_model.dart';
import 'package:client/product/provider/user_provider.dart';
import 'package:client/view/authenticate/auth/viewmodel/authenticate_model.dart';
import 'package:client/view/authenticate/login/view/login_view.dart';
import 'package:client/view/test_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({super.key});

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends AuthenticateModel {
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: ((context) {
        String token = context.watch<UserProvider>().token.toString();

        if (token == '' || token == null) {
          return const LoginView();
        } else {
          return const TestPage();
        }
      }),
    );
  }
}
