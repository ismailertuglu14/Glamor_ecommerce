// ignore_for_file: constant_identifier_names

enum LottiePathEnum {
  ECOMMERCE,
  LOADING,
  CONVERSATION,
  ERROR404,
  PAGENOTFOUND,
  TEAMECOMMERCE
}

extension LottiePathEnumExtension on LottiePathEnum {
  String _pathValue(String path) => 'assets/lotties/lottie-$path.json';

  String get rawValue {
    switch (this) {
      case LottiePathEnum.ECOMMERCE:
        return _pathValue('e-commerce');
      case LottiePathEnum.LOADING:
        return _pathValue('splash-loading');
      case LottiePathEnum.CONVERSATION:
        return _pathValue('conversation');
      case LottiePathEnum.ERROR404:
        return _pathValue('bot-error-404');
      case LottiePathEnum.PAGENOTFOUND:
        return _pathValue('error-page-not-found');
      case LottiePathEnum.TEAMECOMMERCE:
        return _pathValue('team-ecommerce');
    }
  }
}
