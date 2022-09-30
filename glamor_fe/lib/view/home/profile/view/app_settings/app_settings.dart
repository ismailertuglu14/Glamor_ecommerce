import 'package:flutter/material.dart';

class AppSettings extends StatefulWidget {
  const AppSettings({super.key});
  @override
  State<AppSettings> createState() => _AppSettingsState();
}

class _AppSettingsState extends State<AppSettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text('AppSettings'),
          ],
        ),
      ),
    );
  }
}
