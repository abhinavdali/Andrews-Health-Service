import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:fyp/Services/Model/reset_model.dart';
import 'package:meta/meta.dart';

import '../../../Services/Data Provider/data_provider.dart';

part 'reset_event.dart';
part 'reset_state.dart';

class ResetBloc extends Bloc<ResetEvent, ResetState> {
  ResetBloc() : super(ResetInitial()) {
    on<OnReset>((event, emit) async {
      try {
        emit(ResetLoading());
        var data = await DataProvider()
            .resetPass(email: event.email, password: event.password);
        print(data.body);
        var decode = jsonDecode(data.body);
        var finaldata = ResetModel.fromJson(decode);
        if (finaldata.message == 'Password reset') {
          emit(ResetLoaded());
        } else {
          emit(ResetError(message: finaldata.message));
        }
      } catch (e) {
        print(e);
        emit(ResetError(message: 'Something went wrong'));
      }
    });
  }
}
