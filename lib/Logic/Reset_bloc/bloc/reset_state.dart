part of 'reset_bloc.dart';

@immutable
abstract class ResetState {}

class ResetInitial extends ResetState {}

class ResetLoading extends ResetState {}

class ResetLoaded extends ResetState {}

class ResetError extends ResetState {
  final message;
  ResetError({required this.message});
}
