import 'package:client/core/init/theme/app_theme_light.dart';
import 'package:flutter/material.dart';

import '../../constants/enums/app_theme_enum.dart';

class ThemeNotifier extends ChangeNotifier {
  ThemeData _currentTheme = AppThemeLight.instance.theme;

  AppTheme _currenThemeEnum = AppTheme.LIGHT;

  /// Applicaton theme enum.
  /// Deafult value is [AppThemes.LIGHT]
  AppTheme get currenThemeEnum => _currenThemeEnum;

  ThemeData get currentTheme => _currentTheme;

  void changeValue(AppTheme theme) {
    if (theme == AppTheme.LIGHT) {
      _currentTheme = ThemeData.light();
    } else {
      _currentTheme = ThemeData.dark();
    }
    notifyListeners();
  }

  void changeTheme() {
    if (_currenThemeEnum == AppTheme.LIGHT) {
      _currentTheme = ThemeData.dark();
      _currenThemeEnum = AppTheme.DARK;
    } else {
      _currentTheme = AppThemeLight.instance.theme;

      _currenThemeEnum = AppTheme.LIGHT;
    }
    notifyListeners();
  }
}
