part of 'reset_bloc.dart';

@immutable
abstract class ResetEvent {}

class OnReset extends ResetEvent {
  final email, password;
  OnReset({required this.email, required this.password});
}
