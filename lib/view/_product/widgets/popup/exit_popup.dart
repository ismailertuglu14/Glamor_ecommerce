import 'package:flutter/material.dart';

Future<bool> onWillPop(BuildContext context) async {
  bool? exitResult = await showDialog(
    context: context,
    builder: (context) => buildExitPopup(context),
  );
  return exitResult ?? false;
}

AlertDialog buildExitPopup(BuildContext context) {
  return AlertDialog(
    title: const Text('Do u really want to close app?'),
    content: const Text('Click yes for exit.'),
    actions: [
      TextButton(
          onPressed: () {
            Navigator.of(context).pop(false);
          },
          child: const Text('No')),
      TextButton(
          onPressed: () {
            Navigator.of(context).pop(true);
          },
          child: const Text('Yes'))
    ],
  );
}
