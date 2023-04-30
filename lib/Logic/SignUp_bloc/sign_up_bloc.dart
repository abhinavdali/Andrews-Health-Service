
import 'package:bloc/bloc.dart';
import 'package:fyp/Services/Data%20Provider/apiRepository.dart';
import 'package:meta/meta.dart';

import '../../Services/Model/signup_model.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final ApiRepository apiRepository;

  SignUpBloc({required this.apiRepository}) : super(SignUpInitial()) {
    on<OnSignUp>((event, emit) async {
      emit(SignUpInitial());
      try{
        emit(SignUpLoading());
         var data = await apiRepository.getSignUpData(email: event.email, password: event.password, fName: event.fName, lName: event.lName, phone: event.phone);
         emit(SignUpLoaded(signUpModel: data));
      }catch(e){
        print(e);
        emit(SignUpError());
      }
    });
  }
}
