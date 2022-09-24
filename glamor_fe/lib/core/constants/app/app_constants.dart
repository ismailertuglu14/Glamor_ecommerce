// ignore_for_file: constant_identifier_names

class AppConstants {
  static AppConstants? _instance;
  static AppConstants get instance {
    _instance ??= AppConstants._init();
    return _instance!;
  }

  AppConstants._init();

  final String APP_NAME = 'Glamor';
  final String baseUrl = 'https://fakestoreapi.com/';
}
