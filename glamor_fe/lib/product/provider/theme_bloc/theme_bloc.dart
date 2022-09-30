// ignore_for_file: unnecessary_type_check, unused_element

import 'package:bloc/bloc.dart';
import 'package:client/core/constants/enums/app_theme_enum.dart';
import 'package:client/core/init/theme/app_theme_light.dart';
import 'package:flutter/material.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  // You can change ThemeData to Dark or Light by changing [themeData value] inside ThemeState
  ThemeBloc() : super(ThemeState(themeData: AppThemeLight.instance.theme)) {
    on<ThemeEvent>((event, emit) {
      @override
      Stream<ThemeState> mapEventToState(ThemeEvent event) async* {
        if (event is ThemeEvent) {
          yield ThemeState(
              themeData: event.appTheme == AppTheme.LIGHT
                  ? AppThemeLight.instance.theme
                  : ThemeData.dark());
        }
      }
    });
  }
}
