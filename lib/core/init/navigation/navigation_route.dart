import 'package:client/core/constants/navigation/navigation_constants.dart';
import 'package:client/view/authenticate/login/view/login_view.dart';
import 'package:client/view/authenticate/splash/view/splash_view.dart';
import 'package:flutter/material.dart';

class NavigationRoute {
  static final NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;

  NavigationRoute._init();
  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      case NavigationConstants.DEFAULT:
        return normalNavigate(const LoginView(), NavigationConstants.DEFAULT);
      case NavigationConstants.LOGIN_VIEW:
        return normalNavigate(
            const LoginView(), NavigationConstants.LOGIN_VIEW);

      default:
        throw Exception('Screen doesn\'t exist!');
      /* return MaterialPageRoute(
          builder: (context) => NotFoundNavigationWidget(),
        ); */
    }
  }

  MaterialPageRoute normalNavigate(Widget widget, String pageName) {
    return MaterialPageRoute(
        builder: (context) => widget,
        //analytciste görülecek olan sayfa ismi için pageName veriyoruz
        settings: RouteSettings(name: pageName));
  }
}
