// ignore_for_file: sized_box_for_whitespace, deprecated_member_use, avoid_print

import 'package:client/core/constants/image/image_constants.dart';
import 'package:client/core/extension/context_extension.dart';
import 'package:client/core/init/navigation/navigation_service.dart';
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
        padding: const ScaffoldPadding.paddingNormal(),
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
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildText(BuildContext context) {
    return Container(
      width: context.mediaQuery.size.width,
      height: context.mediaQuery.size.height * 0.4,
      padding: const CustomPadding.paddingLow(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _customText(context, 'Enjoy'),
          _customText(context, 'your'),
          _customText(context, 'online'),
          _customText(context, 'shopping'),
        ],
      ),
    );
  }

  Text _customText(BuildContext context, String text) {
    return Text(
      text,
      style: context.textTheme.headlineLarge!
          .copyWith(color: Colors.black, fontWeight: FontWeight.w600),
    );
  }

  Widget _buildButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('Clicked');
        NavigationService.instance.navigateToPage(path: '/test');
      },
      child: Container(
          height: context.mediumValue,
          width: context.mediaQuery.size.width,
          margin: const CustomPadding.paddingNormal2(),
          decoration: BoxDecoration(
            color: context.theme.colorScheme.primaryContainer,
            borderRadius: const CustomBorderRadius.radiusLow(),
          ),
          child: Center(
            child: Text(
              'Login',
              style: context.textTheme.headline5!
                  .copyWith(color: context.theme.colorScheme.primaryVariant),
              textAlign: TextAlign.center,
            ),
          )),
    );
  }
}
