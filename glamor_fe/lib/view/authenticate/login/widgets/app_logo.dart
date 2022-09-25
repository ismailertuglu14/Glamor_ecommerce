import 'package:client/core/extension/context_extension.dart';
import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      '🇬​🇱​🇦​🇲​🇴​🇷​',
      style: Theme.of(context).textTheme.displaySmall!.copyWith(
          color: context.theme.colorScheme.primaryVariant, fontSize: 28),
    );
  }
}
