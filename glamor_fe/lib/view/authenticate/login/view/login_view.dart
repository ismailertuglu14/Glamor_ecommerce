// ignore_for_file: deprecated_member_use, avoid_print
import 'package:client/product/constants/duration_items.dart';
import 'package:client/product/utility/border_radius.dart';
import 'package:client/product/utility/custom_padding.dart';
import 'package:client/view/_product/utility/validation.dart';
import 'package:client/view/authenticate/login/viewmodel/login_view_model.dart';
import 'package:client/view/home/home_test.dart';
import 'package:flutter/material.dart';
import 'package:client/core/extension/context_extension.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends LoginViewModel {
  @override
  Widget build(BuildContext context) {
    return _buildScreen(context);
  }

  GestureDetector _buildScreen(BuildContext context) {
    return GestureDetector(
      onTap: () => setFocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const CustomPadding.paddingNormal(),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Welcome to CartDropper'),
                _buildTextFormField(
                  'Email',
                  emailController,
                  email,
                ),
                _buildTextFormField(
                  'Password',
                  passwordController,
                  password,
                ),
                _buildButton(context, 'Login', () {
                  /* Next Change */
                  final form = formKey.currentState!;
                  if (form.validate()) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomeTest()));
                  }
                }),
                _isKeyboardOpenWidget(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  AnimatedContainer _isKeyboardOpenWidget(BuildContext context) {
    return AnimatedContainer(
      height: WidgetsBinding.instance.window.viewInsets.bottom > 0
          ? context.highValue * 1.5
          : 0,
      duration: DurationItems.durationLow(),
      child: null,
    );
  }

  Padding _buildTextFormField(
    String hint,
    TextEditingController controller,
    String type,
  ) {
    return Padding(
      padding: const CustomPadding.padVertLow(),
      child: TextFormField(
        controller: controller,
        onChanged: (value) => type = value,
        validator: (value) => type == 'email'
            ? Validations.instance.validateEmail(value!)
            : Validations.instance.validatePassword(value!),
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

  InkWell _buildButton(BuildContext context, String text, Function onComplete) {
    return InkWell(
      onTap: () async => isLoading == true ? null : fetchLoginService(),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 20),
        width: context.mediaQuery.size.width,
        height: context.mediumValue,
        decoration: BoxDecoration(
          borderRadius: const CustomBorderRadius.radiusLow(),
          color: context.theme.colorScheme.surface,
        ),
        child: Center(
          child: Text(
            text,
            style: context.textTheme.headline5!
                .copyWith(color: context.theme.colorScheme.primaryVariant),
          ),
        ),
      ),
    );
  }
}
