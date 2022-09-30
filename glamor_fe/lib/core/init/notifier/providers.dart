import 'package:client/core/init/network/vexana_manager.dart';
import 'package:client/core/init/notifier/theme_notifier.dart';
import 'package:client/product/provider/theme_bloc/theme_bloc.dart';
import 'package:client/product/provider/user_provider.dart';
import 'package:client/view/authenticate/bloc/auth_bloc.dart';
import 'package:client/view/authenticate/login/service/login_service.dart';
import 'package:client/view/home/builder/viewmodel/home_wrapper_model.dart';
import 'package:client/view/home/category/cubit/category_cubit.dart';
import 'package:client/view/home/category/service/category_service.dart';
import 'package:client/view/home/feed/cubit/products_cubit.dart';
import 'package:client/view/home/feed/service/product_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    ChangeNotifierProvider(create: (context) => HomeProvider()),
    BlocProvider(
        create: (context) => AuthBloc(
            loginService: LoginService(VexanaManager.instance.networkManager),
            context: context)),
    Provider(
        create: (context) =>
            LoginService(VexanaManager.instance.networkManager)),
    Provider.value(value: NavigationService.instance)
  ];
  dynamic blocProviders = [
    BlocProvider<AuthBloc>(
      lazy: true,
      create: (context) {
        return AuthBloc(
          loginService: LoginService(VexanaManager.instance.networkManager),
          context: context,
        );
      },
    ),
    BlocProvider(
      lazy: true,
      create: (context) =>
          ProductsCubit(ProductService(VexanaManager.instance.networkManager)),
    ),
    BlocProvider(
        create: (context) => CategoryCubit(
            CategoryService(VexanaManager.instance.networkManager))),
    BlocProvider(create: (context) => ThemeBloc()),
  ];
}
