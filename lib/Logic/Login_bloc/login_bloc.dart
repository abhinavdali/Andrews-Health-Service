
import 'package:bloc/bloc.dart';
import 'package:fyp/Services/Data%20Provider/apiRepository.dart';
import 'package:meta/meta.dart';

import '../../Services/Model/login_model.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final ApiRepository apiRepository;

  LoginBloc({required this.apiRepository}) : super(LoginInitial()) {
    on<OnLogin>((event, emit) async {
      emit(LoginInitial());
      try{
        emit(LoginLoading());
        var data = await apiRepository.getAuthenticationData(username: event.email, password: event.password);

        emit(LoginLoaded(loginModel: data));
      }catch(e){
        print(e);
        emit(LoginError());
      }

    });
  }
}
