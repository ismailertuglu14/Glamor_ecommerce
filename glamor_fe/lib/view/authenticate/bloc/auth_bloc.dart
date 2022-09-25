// ignore_for_file: unrelated_type_equality_checks

import 'package:bloc/bloc.dart';
import 'package:client/view/authenticate/login/model/login_model.dart';
import 'package:client/view/authenticate/login/service/login_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginService loginService;
  final BuildContext context;
  AuthBloc({required this.loginService, required this.context})
      : super(AuthInitial()) {
    on<LoginEvent>((event, emit) async {
      emit(AuthLoading());

      final result = await loginService.fetchUser(
        LoginModel(
            email: event.email.toString(), password: event.password.toString()),
        context,
      );

      if (result?.success == true) {
        emit(AuthSuccessful());
      } else if (result?.success != true) {
        emit(AuthError("Missing password OR  user not found"));
        emit(AuthInitial());
      }
    });
  }
}
