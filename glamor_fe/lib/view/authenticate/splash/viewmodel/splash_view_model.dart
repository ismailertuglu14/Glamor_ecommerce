import 'package:client/core/constants/enums/locale_keys_enum.dart';
import 'package:client/core/constants/navigation/navigation_constants.dart';
import 'package:client/product/utility/duration_items.dart';
import 'package:client/view/authenticate/splash/view/splash_view.dart';
import 'package:client/view/authenticate/splash/viewmodel/cache_init.dart';
import 'package:flutter/cupertino.dart';

import '../../../../core/base/base_view_model.dart';

abstract class SplashViewModel extends State<SplashView>
    with BaseViewModel, CacheInit {
  late bool
      isFirst; // if isFirst = true Then route to onboard screen, if false Then route to Login View
  @override
  void initState() {
    super.initState();
    initAppState();
    Future.delayed(DurationItems.durationHigh()).then((value) {
      isFirst
          ? navigation.navigateToPageClear(
              path: NavigationConstants.ON_BOARD_VIEW)
          : navigation.navigateToPageClear(path: NavigationConstants.AUTH);
    });
  }

  Future<void> initAppState() async {
    await cacheInit().then(
        (_) => isFirst = localeManager.getBoolValue(PreferencesKeys.IS_FIRST));
  }

  @override
  void dispose() {
    super.dispose();
  }
}
