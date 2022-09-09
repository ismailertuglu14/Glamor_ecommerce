import 'package:client/core/constants/navigation/navigation_constants.dart';
import 'package:client/product/constants/duration_items.dart';
import 'package:client/view/authenticate/splash/view/splash_view.dart';
import 'package:client/view/authenticate/splash/viewmodel/cache_init.dart';
import 'package:flutter/cupertino.dart';

import '../../../../core/base/base_view_model.dart';

abstract class SplashViewModel extends State<SplashView>
    with BaseViewModel, CacheInit {
  @override
  void initState() {
    super.initState();
    cacheInit();
    Future.delayed(DurationItems.durationUltra()).then((_) {
      navigation.navigateToPageClear(path: NavigationConstants.LOGIN_VIEW);
    });
  }

  @override
  void dispose() {
    super.dispose();
  }
}
