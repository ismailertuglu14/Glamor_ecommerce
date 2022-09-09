class OnboardModel {
  final String title;
  final String description;
  final String image;

  OnboardModel(this.title, this.description, this.image);
  String get imagePath => 'assets/images/$image.png';
}

class OnboardModels {
  final List<OnboardModel> onboardItems = [
    OnboardModel('Order Your Food', 'Description Area', '1'),
    OnboardModel('Order Your Food', 'Description Area', '2'),
    OnboardModel('Order Your Food', 'Description Area', '3'),
  ];
}
