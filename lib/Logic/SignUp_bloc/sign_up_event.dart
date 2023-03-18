part of 'sign_up_bloc.dart';

@immutable
abstract class SignUpEvent {}

class OnSignUp extends SignUpEvent{
  final fName,lName,email,phone,password,confirm;
  OnSignUp({required this.fName,required this.lName, required this.email,required this.phone,required this.password, required this.confirm});
}