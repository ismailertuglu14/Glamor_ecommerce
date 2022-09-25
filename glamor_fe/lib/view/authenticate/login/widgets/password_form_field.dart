import 'package:client/view/_product/utility/validation.dart';
import 'package:flutter/material.dart';

import '../../../../product/utility/custom_padding.dart';

class PasswordFormField extends StatefulWidget {
  final TextEditingController passwordController;

  const PasswordFormField(this.passwordController, {super.key});

  @override
  State<PasswordFormField> createState() => _PasswordFormFieldState();
}

class _PasswordFormFieldState extends State<PasswordFormField> {
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const CustomPadding.padVertLow(),
      child: TextFormField(
        controller: widget.passwordController,
        validator: (value) => Validations.instance.validatePassword(value!),
        cursorColor: Colors.black,
        keyboardType: TextInputType.visiblePassword,
        obscureText: isObscure,
        decoration: InputDecoration(
            suffixIcon: IconButton(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onPressed: (() {
                setState(() {
                  isObscure = !isObscure;
                });
              }),
              icon: Icon(isObscure == true
                  ? Icons.remove_red_eye_outlined
                  : Icons.remove_red_eye),
            ),
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            contentPadding:
                const EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
            hintText: 'Password'),
      ),
    );
  }
}
