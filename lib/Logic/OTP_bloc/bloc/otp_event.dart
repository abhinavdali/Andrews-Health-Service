part of 'otp_bloc.dart';

@immutable
abstract class OtpEvent {}

class OnOTPSent extends OtpEvent {
  final email, OTP;
  OnOTPSent({required this.email, required this.OTP});
}
