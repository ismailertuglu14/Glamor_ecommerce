// ignore_for_file: prefer_const_constructors

import 'package:client/core/constants/app/app_constants.dart';
import 'package:client/core/init/notifier/providers.dart';
import 'package:client/product/provider/theme_bloc/theme_bloc.dart';
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
      providers: ApplicationProvider.instance.blocProviders,
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
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: AppConstants.instance.APP_NAME,
          theme: state.themeData,
          onGenerateRoute: NavigationRoute.instance.generateRoute,
          navigatorKey: NavigationService.instance.navigatorKey,
        );
      },
    );
  }
}
