import 'package:client/view/authenticate/onboard/screens/get_started.dart';
import 'package:client/view/authenticate/onboard/screens/screen2.dart';

import '../screens/screen1.dart';

class OnboardModel {
  final String? title;
  final String? description;
  final String image;

  OnboardModel(this.title, this.description, this.image);
  String get imagePath => 'assets/images/$image.png';
}

class OnboardModels {
  final List onboardItems = [
    Screen1(),
    Screen2(),
    GetStarted(),
  ];
}
