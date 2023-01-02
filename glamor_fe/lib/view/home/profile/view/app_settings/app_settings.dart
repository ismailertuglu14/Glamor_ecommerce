import 'package:client/core/extension/string_extension.dart';
import 'package:client/core/init/language/language_manager.dart';
import 'package:client/core/init/language/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class AppSettings extends StatefulWidget {
  AppSettings({super.key});
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
          children: [
            const Text("Change Language"),
            GestureDetector(
                onTap: () {
                  EasyLocalization.of(context)!
                      .setLocale(LanguageManager.instance.enLocale);
                },
                child: const Text('English')),
            GestureDetector(
                onTap: () {
                  EasyLocalization.of(context)!
                      .setLocale(LanguageManager.instance.trLocale);
                },
                child: const Text('Türkçe')),
            Text(LocaleKeys.welcome.locale),
            Text("Current Language : ${context.locale}"),
          ],
        ),
      ),
    );
  }
}
