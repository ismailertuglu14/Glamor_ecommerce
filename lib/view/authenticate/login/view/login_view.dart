import 'package:client/product/utility/custom_padding.dart';
import 'package:client/view/authenticate/login/viewmodel/login_view_model.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends LoginViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const CustomPadding.paddingNormal(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Welcome to CartDropper'),
            _buildTextFormField('Email'),
            _buildTextFormField('Password'),
          ],
        ),
      ),
    );
  }

  Widget _buildTextFormField(String hint) {
    return Padding(
      padding: const CustomPadding.padVertLow(),
      child: TextFormField(
        cursorColor: Colors.black,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            contentPadding:
                const EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
            hintText: hint),
      ),
    );
  }
}
