// ignore_for_file: must_be_immutable

part of 'auth_bloc.dart';

@immutable
abstract class AuthState extends Equatable {}

class AuthInitial extends AuthState {
  @override
  List<Object?> get props => [];
}

class AuthSuccessful extends AuthState {
  @override
  List<Object?> get props => [];
}

class AuthLoading extends AuthState {
  @override
  List<Object?> get props => [];
}

class AuthError extends AuthState {
  String? msgError;
  AuthError(this.msgError);
  @override
  List<Object?> get props => [msgError];
}
