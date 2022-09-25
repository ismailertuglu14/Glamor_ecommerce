import 'package:client/view/_product/utility/validation.dart';
import 'package:flutter/material.dart';

import '../../../../product/utility/custom_padding.dart';

class EmailFormField extends StatefulWidget {
  final TextEditingController emailController;
  const EmailFormField(this.emailController, {super.key});

  @override
  State<EmailFormField> createState() => _EmailFormFieldState();
}

class _EmailFormFieldState extends State<EmailFormField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const CustomPadding.padVertLow(),
      child: TextFormField(
        controller: widget.emailController,
        validator: (value) => Validations.instance.validateEmail(value!),
        cursorColor: Colors.black,
        keyboardType: TextInputType.emailAddress,
        decoration: const InputDecoration(
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            contentPadding:
                EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
            hintText: 'Email'),
      ),
    );
  }
}
