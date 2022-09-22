import 'package:client/core/init/notifier/theme_notifier.dart';
import 'package:client/product/provider/user_provider.dart';
import 'package:client/view/home/builder/viewmodel/home_wrapper_model.dart';
import 'package:client/view/home/feed/service/product_notifier.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../navigation/navigation_service.dart';

class ApplicationProvider {
  static ApplicationProvider? _instance;
  static ApplicationProvider get instance {
    if (_instance != null) return _instance!;
    _instance = ApplicationProvider._init();
    return _instance!;
  }

  ApplicationProvider._init();

  List<SingleChildWidget> providers = [
    ChangeNotifierProvider(create: (context) => ThemeNotifier()),
    ChangeNotifierProvider(create: (context) => UserProvider()),
    ChangeNotifierProvider(create: (context) => ProductNotifier()),
    ChangeNotifierProvider(create: (context) => HomeProvider()),
    Provider.value(value: NavigationService.instance)
  ];
}