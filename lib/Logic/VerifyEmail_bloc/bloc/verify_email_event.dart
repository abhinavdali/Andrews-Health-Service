part of 'verify_email_bloc.dart';

@immutable
abstract class VerifyEmailEvent {}

class OnEmailVerify extends VerifyEmailEvent {
  final String email;
  OnEmailVerify({required this.email});
}
