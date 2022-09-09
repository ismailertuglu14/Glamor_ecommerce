// ignore_for_file: sized_box_for_whitespace

import 'package:client/core/constants/image/image_constants.dart';
import 'package:client/core/extension/context_extension.dart';
import 'package:client/product/utility/border_radius.dart';
import 'package:client/product/utility/custom_padding.dart';
import 'package:client/product/utility/scaffold_padding.dart';
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
    return _buildScaffold(context);
  }

  Widget _buildScaffold(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const ScaffoldPadding.paddingLow(),
        child: Container(
          width: context.mediaQuery.size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildIcon(context),
              _buildText(context),
              _buildButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIcon(BuildContext context) {
    return Container(
      margin: const CustomPadding.paddingHigh(),
      width: context.mediaQuery.size.width * 0.8,
      height: context.mediaQuery.size.height * 0.3,
      child: Image.asset(
        ImageConstants.instance.loginShopping,
        fit: BoxFit.contain,
      ),
    );
  }

  Widget _buildText(BuildContext context) {
    return Container(
      width: context.mediaQuery.size.width,
      padding: const CustomPadding.paddingHigh(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Enjoy',
            style:
                context.textTheme.headlineLarge!.copyWith(color: Colors.black),
          ),
          Text(
            'your',
            style:
                context.textTheme.headlineLarge!.copyWith(color: Colors.black),
          ),
          Text(
            'online',
            style:
                context.textTheme.headlineLarge!.copyWith(color: Colors.black),
          ),
          Text(
            'shopping',
            style:
                context.textTheme.headlineLarge!.copyWith(color: Colors.black),
          ),
        ],
      ),
    );
  }

  Widget _buildButton(BuildContext context) {
    return Container(
        height: context.mediumValue,
        width: context.mediaQuery.size.width,
        margin: const CustomPadding.paddingLow(),
        decoration: BoxDecoration(
          color: context.theme.colorScheme.primaryContainer,
          borderRadius: const CustomBorderRadius.radiusLow(),
        ),
        child: GestureDetector(
          onTap: () {},
          child: Center(
            child: Text(
              'Login',
              style: context.textTheme.headline5,
              textAlign: TextAlign.center,
            ),
          ),
        ));
  }
}
