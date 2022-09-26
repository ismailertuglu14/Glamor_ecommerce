// ignore_for_file: deprecated_member_use, avoid_print
import 'package:client/product/utility/border_radius.dart';
import 'package:client/product/utility/custom_padding.dart';
import 'package:client/view/_product/widgets/close/close_keyboard.dart';
import 'package:client/view/authenticate/login/viewmodel/login_view_model.dart';
import 'package:client/view/authenticate/login/widgets/app_logo.dart';
import 'package:client/view/authenticate/login/widgets/email_form_field.dart';
import 'package:client/view/authenticate/login/widgets/password_form_field.dart';
import 'package:client/view/authenticate/login/widgets/register_text.dart';
import 'package:flutter/material.dart';
import 'package:client/core/extension/context_extension.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/auth_bloc.dart';

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

  Widget _buildScreen(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return CloseKeyboard(
        widget: GestureDetector(
      child: Scaffold(
        //  resizeToAvoidBottomInset: false,
        body: Container(
          height: height,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xff0F0C29),
              Color(0xff302B63),
              Color(0xff24243E),
            ],
          )),
          /* decoration: BoxDecoration(
              gradient: linearGradient(180, ['#0F0C29', '#302B63', '#24243E'])), */
          padding: const CustomPadding.paddingNormal(),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const AppLogo(),
                SizedBox(height: context.lowValue * 3),
                EmailFormField(emailController),
                // _buildTextFormField('Email', emailController, email),
                PasswordFormField(passwordController),
                _buildButton(context, 'Login'),
                const RegisterText(),
              ],
            ),
          ),
        ),
      ),
    ));
  }

/*   AnimatedContainer _isKeyboardOpenWidget(BuildContext context) {
    return AnimatedContainer(
      height: WidgetsBinding.instance.window.viewInsets.bottom > 0
          ? context.highValue * 55.5
          : 0,
      duration: DurationItems.durationLow(),
      child: null,
    );
  } */

  Widget _buildButton(BuildContext context, String text) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthError) {
          print('Auth Error');
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text(
            'Error',
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.blue, fontSize: 30),
          )));
        } else if (state is AuthSuccessful) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              backgroundColor: Colors.black,
              content: Text(
                'Login Successfull',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 30,
                ),
              )));
        }
      },
      child: InkWell(
        onTap: () async => context.read<AuthBloc>() is AuthLoading == true
            ? null
            : formKey.currentState!.validate()
                ? authBloc!.add(LoginEvent(
                    email: emailController.text,
                    password: passwordController.text))
                : null, //fetchLoginService(),
        child: Container(
          width: context.mediaQuery.size.width,
          height: context.mediumValue,
          decoration: BoxDecoration(
            borderRadius: const CustomBorderRadius.radiusLow(),
            color: context.theme.colorScheme.onSecondary,
          ),
          child: context.watch<AuthBloc>().state is AuthLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Center(
                  child: Text(
                    text,
                    style: context.textTheme.headline5!.copyWith(
                        color: context.theme.colorScheme.primaryVariant),
                  ),
                ),
        ),
      ),
    );
  }
}
