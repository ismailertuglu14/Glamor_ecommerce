// ignore_for_file: constant_identifier_names, non_constant_identifier_names

class AppConstants {
  static AppConstants? _instance;
  static AppConstants get instance {
    _instance ??= AppConstants._init();
    return _instance!;
  }

  AppConstants._init();

  static const String APP_NAME = 'Glamor';
  static const LANG_ASSET_PATH = 'assets/lang';

  static const String APP_VERSION = '1.0.0';
}
