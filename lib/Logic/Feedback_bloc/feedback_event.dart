part of 'feedback_bloc.dart';

@immutable
abstract class FeedbackEvent {}

class OnFeedbackMade extends FeedbackEvent{
  final String name,email,phone,message;
  OnFeedbackMade({required this.name,required this.phone,required this.email,required this.message});
}