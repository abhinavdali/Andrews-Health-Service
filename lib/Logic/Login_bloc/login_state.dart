part of 'login_bloc.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginError extends LoginState {}

class LoginLoaded extends LoginState {
  final LoginModel loginModel;
  LoginLoaded({required this.loginModel});
}

