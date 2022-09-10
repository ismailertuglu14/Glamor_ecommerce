import 'package:client/core/base/base_view_model.dart';
import 'package:client/view/authenticate/auth/viewmodel/authenticate_model.dart';
import 'package:client/view/authenticate/login/view/login_view.dart';
import 'package:client/view/test_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({super.key});

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends AuthenticateModel {
  @override
  Widget build(BuildContext context) {
    int x = 0;
    return Builder(
      builder: ((context) {
        if (x > 0) {
          return const LoginView();
        } else {
          return const TestPage();
        }
      }),
    );
  }
}
//TEST AMAÇLI