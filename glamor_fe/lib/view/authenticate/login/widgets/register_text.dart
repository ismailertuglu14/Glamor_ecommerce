// ignore_for_file: avoid_print, deprecated_member_use

import 'package:client/core/init/navigation/navigation_service.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/navigation/navigation_constants.dart';

class RegisterText extends StatelessWidget {
  const RegisterText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: RichText(
        text: TextSpan(
          text: 'Don\'t have an account yet? ',
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: Theme.of(context).colorScheme.primaryVariant,
              fontWeight: FontWeight.w400),
          children: <TextSpan>[
            TextSpan(
                text: 'REGISTER',
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    NavigationService.instance.navigateToPage(
                        path: NavigationConstants.REGISTER_VIEW);
                  },
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onInverseSurface)),
          ],
        ),
      ),
    );
  }
}
