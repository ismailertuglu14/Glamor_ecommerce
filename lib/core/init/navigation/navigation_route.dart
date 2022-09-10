import 'package:client/core/constants/navigation/navigation_constants.dart';
import 'package:client/view/authenticate/login/view/login_view.dart';
import 'package:client/view/authenticate/onboard/view/onboard_view.dart';
import 'package:client/view/authenticate/splash/view/splash_view.dart';
import 'package:client/view/not_found/not_found_view.dart';
import 'package:client/view/test_page.dart';
import 'package:flutter/material.dart';

class NavigationRoute {
  static final NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;
  NavigationRoute._init();
  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      case NavigationConstants.DEFAULT:
        // return normalNavigate(const LoginView(), NavigationConstants.DEFAULT);
        return normalNavigate(const SplashView(), NavigationConstants.DEFAULT);
      case NavigationConstants.ON_BOARD_VIEW:
        return normalNavigate(
            const OnboardView(), NavigationConstants.ON_BOARD_VIEW);

      case NavigationConstants.LOGIN_VIEW:
        return animatedNavigate(const LoginView());
      case NavigationConstants.TEST_VIEW:
        return normalNavigate(const TestPage(), NavigationConstants.TEST_VIEW);
      default:
        throw normalNavigate(
            const NotFoundView(), NavigationConstants.NOT_FOUND_VIEW);
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

  PageRouteBuilder animatedNavigate(Widget widget) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => widget,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}
