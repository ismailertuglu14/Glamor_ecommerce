class ImageConstants {
  static ImageConstants? _instace;

  static ImageConstants get instance => _instace ??= ImageConstants._init();

  ImageConstants._init();

  String get loginShopping => toPng('login-shopping');
  String get appLogo => toPng('Black-in-Jacket10');
  String toPng(String name) => 'assets/images/$name.png';
}
