// ignore: constant_identifier_names
enum LottiePathEnum { ECOMMERCE, LOADING }

extension LottiePathEnumExtension on LottiePathEnum {
  String _pathValue(String path) => 'assets/lotties/lottie-$path.json';

  String get rawValue {
    switch (this) {
      case LottiePathEnum.ECOMMERCE:
        return _pathValue('e-commerce');
      case LottiePathEnum.LOADING:
        return _pathValue('splash-loading');
    }
  }
}
