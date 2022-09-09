class ImageConstants {
  static ImageConstants? _instace;

  static ImageConstants get instance => _instace ??= ImageConstants._init();

  ImageConstants._init();

  String get loginShopping => toPng('login-shopping');

  String toPng(String name) => 'assets/images/$name.png';
}
