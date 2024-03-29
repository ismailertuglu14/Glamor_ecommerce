import 'package:client/core/constants/navigation/navigation_constants.dart';
import 'package:client/view/authenticate/auth/view/authenticate.dart';
import 'package:client/view/authenticate/login/view/login_view.dart';
import 'package:client/view/authenticate/onboard/view/onboard_view.dart';
import 'package:client/view/authenticate/register/view/register_view.dart';
import 'package:client/view/authenticate/splash/view/splash_view.dart';
import 'package:client/view/home/builder/view/home_wrapper.dart';
import 'package:client/view/home/category/models/subcategory_model.dart';
import 'package:client/view/home/category/view/category_view.dart';
import 'package:client/view/home/category/view/subcategory_view.dart';
import 'package:client/view/home/feed/model/product_model.dart';
import 'package:client/view/home/product/view/product_view.dart';
import 'package:client/view/home/profile/view/app_settings/app_settings.dart';
import 'package:client/view/not_found/not_found_view.dart';
import 'package:flutter/material.dart';

import '../../../view/home/profile/view/profile_detail/view/profile_detail_view.dart';

class NavigationRoute {
  static final NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;
  NavigationRoute._init();
  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      // Splash View
      case NavigationConstants.DEFAULT:
        // return normalNavigate(const LoginView(), NavigationConstants.DEFAULT);
        return normalNavigate(const SplashView(), NavigationConstants.DEFAULT);
      //Onboard Slider View
      case NavigationConstants.ON_BOARD_VIEW:
        return normalNavigate(
            const OnboardView(), NavigationConstants.ON_BOARD_VIEW);
      //Auth Builder
      case NavigationConstants.AUTH:
        return normalNavigate(const Authenticate(), NavigationConstants.AUTH);
      // Login View
      case NavigationConstants.LOGIN_VIEW:
        return animatedNavigate(const LoginView());
      case NavigationConstants.REGISTER_VIEW:
        return normalNavigate(
            const RegisterView(), NavigationConstants.REGISTER_VIEW);
      // Category View
      case NavigationConstants.CATEGORY:
        return normalNavigate(
            const CategoryView(), NavigationConstants.CATEGORY);

      case NavigationConstants.SUBCATEGORY:
        return normalNavigate(
          SubCategoryView(subCategories: args.arguments as List<Subcategory>?),
          NavigationConstants.SUBCATEGORY,
        );

      // Product View
      case NavigationConstants.PRODUCT_VIEW:
        return normalNavigate(ProductView(product: args.arguments as Product),
            NavigationConstants.PRODUCT_VIEW);

      /*  SETTINGS */

      case NavigationConstants.APP_SETTINGS:
        return normalNavigate(AppSettings(), NavigationConstants.APP_SETTINGS);

      /* PROFILE DETAIL*/
      case NavigationConstants.PROFILE_DETAIL:
        return normalNavigate(
            const ProfileDetailView(), NavigationConstants.PROFILE_DETAIL);

      //Test View
      case NavigationConstants.TEST_VIEW:
        return normalNavigate(
            const HomeWrapper(), NavigationConstants.TEST_VIEW);
      //Not Found View
      default:
        return normalNavigate(
            const NotFoundView(), NavigationConstants.NOT_FOUND_VIEW);
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
