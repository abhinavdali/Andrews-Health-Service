import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:fyp/Services/Data%20Provider/apiRepository.dart';
import 'package:fyp/Services/Data%20Provider/data_provider.dart';
import 'package:fyp/Services/Model/verify_email_model.dart';
import 'package:meta/meta.dart';

part 'verify_email_event.dart';
part 'verify_email_state.dart';

class VerifyEmailBloc extends Bloc<VerifyEmailEvent, VerifyEmailState> {
  VerifyEmailBloc() : super(VerifyEmailInitial()) {
    on<OnEmailVerify>((event, emit) async {
      try {
        emit(VerifyEmailLoading());
        var data = await DataProvider().verifyEmail(email: event.email);
        var decode = jsonDecode(data.body);
        var finaldata = VerifyEmailModel.fromJson(decode);
        if (finaldata.data == 'OTP sent') {
          emit(VerifyEmailLoaded());
        } else {
          emit(VerifyEmailError(message: finaldata.data));
        }
      } catch (e) {
        print(e);
        emit(VerifyEmailError(message: 'Something went wrong'));
      }
    });
  }
}
