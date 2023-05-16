part of 'verify_email_bloc.dart';

@immutable
abstract class VerifyEmailState {}

class VerifyEmailInitial extends VerifyEmailState {}

class VerifyEmailLoading extends VerifyEmailState {}

class VerifyEmailLoaded extends VerifyEmailState {}

class VerifyEmailError extends VerifyEmailState {
  final message;
  VerifyEmailError({required this.message});
}
