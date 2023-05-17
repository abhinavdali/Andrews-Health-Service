import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:fyp/Services/Data%20Provider/data_provider.dart';
import 'package:meta/meta.dart';

import '../../../Services/Model/verify_email_model.dart';

part 'otp_event.dart';
part 'otp_state.dart';

class OtpBloc extends Bloc<OtpEvent, OtpState> {
  OtpBloc() : super(OtpInitial()) {
    on<OnOTPSent>((event, emit) async {
      try {
        emit(OtpLoading());
        print(event.OTP);
        print(event.email);
        var data =
            await DataProvider().verifyOTP(email: event.email, OTP: event.OTP);
        print(data.body);
        var decode = jsonDecode(data.body);
        var finaldata = VerifyEmailModel.fromJson(decode);
        if (finaldata.data == 'approved') {
          emit(OtpLoaded());
        } else {
          emit(OtpError(message: finaldata.data));
        }
      } catch (e) {
        print(e);
        emit(OtpError(message: 'Something went wrong'));
      }
    });
  }
}
