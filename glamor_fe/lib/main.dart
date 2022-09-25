// ignore_for_file: prefer_const_constructors

import 'package:client/core/constants/app/app_constants.dart';
import 'package:client/core/init/network/vexana_manager.dart';
import 'package:client/core/init/notifier/providers.dart';
import 'package:client/core/init/notifier/theme_notifier.dart';
import 'package:client/product/network/product_network_manager.dart';
import 'package:client/view/authenticate/bloc/auth_bloc.dart';
import 'package:client/view/authenticate/login/service/login_service.dart';
import 'package:client/view/home/category/cubit/category_cubit.dart';
import 'package:client/view/home/category/service/category_service.dart';
import 'package:client/view/home/feed/cubit/products_cubit.dart';
import 'package:client/view/home/feed/service/IProductService.dart';
import 'package:client/view/home/feed/service/product_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'core/init/navigation/navigation_route.dart';
import 'core/init/navigation/navigation_service.dart';

void main() {
  initApp();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(create: (context) {
          return AuthBloc(
            loginService: LoginService(VexanaManager.instance.networkManager),
            context: context,
          );
        }),
        BlocProvider(
          create: (context) =>
              ProductsCubit(ProductService(ProductNetworkManager())),
        ),
        BlocProvider(
          create: (context) =>
              CategoryCubit(CategoryService(ProductNetworkManager())),
        ),
      ],
      child: MultiProvider(
        providers: ApplicationProvider.instance.providers,
        child: MyApp(),
      ),
    ),
  );
}

initApp() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppConstants.instance.APP_NAME,
      theme: context.watch<ThemeNotifier>().currentTheme,
      onGenerateRoute: NavigationRoute.instance.generateRoute,
      navigatorKey: NavigationService.instance.navigatorKey,
    );
  }
}
