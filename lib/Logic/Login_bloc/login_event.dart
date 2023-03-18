part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class OnLogin extends LoginEvent{
  final email,password;
  OnLogin({required this.email,required this.password});
}