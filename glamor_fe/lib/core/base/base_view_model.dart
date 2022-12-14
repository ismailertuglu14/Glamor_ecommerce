import 'package:client/core/init/navigation/navigation_service.dart';

import '../init/cache/locale_manager.dart';
import '../init/network/vexana_manager.dart';

abstract class BaseViewModel {
  LocaleManager localeManager = LocaleManager.instance;
  NavigationService navigation = NavigationService.instance;
  VexanaManager? vexanaManager = VexanaManager.instance;
}
