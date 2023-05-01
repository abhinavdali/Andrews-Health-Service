import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:fyp/Services/Data%20Provider/apiRepository.dart';
import 'package:fyp/Services/Model/feedback_model.dart';
import 'package:meta/meta.dart';

part 'feedback_event.dart';
part 'feedback_state.dart';

class FeedbackBloc extends Bloc<FeedbackEvent, FeedbackState> {
  final ApiRepository apiRepository;

  FeedbackBloc({required this.apiRepository}) : super(FeedbackInitial()) {
    on<OnFeedbackMade>((event, emit) async {
      try{
        emit(FeedbackLoading());
        var data = await apiRepository.postFeedback(email: event.email, phone: event.phone, name: event.name, message: event.message);
        emit(FeedbackLoaded(feedbackModel: data));
      }catch(e){
        print(e);
        emit(FeedbackError());
      }
    });
  }
}
