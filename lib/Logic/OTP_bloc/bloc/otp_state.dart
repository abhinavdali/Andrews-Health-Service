part of 'otp_bloc.dart';

@immutable
abstract class OtpState {}

class OtpInitial extends OtpState {}

class OtpLoading extends OtpState {}

class OtpLoaded extends OtpState {}

class OtpError extends OtpState {
  final message;
  OtpError({required this.message});
}
