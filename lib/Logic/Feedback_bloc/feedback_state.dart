part of 'feedback_bloc.dart';

@immutable
abstract class FeedbackState {}

class FeedbackInitial extends FeedbackState {}

class FeedbackLoading extends FeedbackState {}

class FeedbackLoaded extends FeedbackState {
  final FeedbackModel feedbackModel;
  FeedbackLoaded({required this.feedbackModel});
}

class FeedbackError extends FeedbackState {}
