part of 'services_bloc.dart';

@immutable
abstract class ServicesState {}

class ServicesInitial extends ServicesState {}

class ServicesLoading extends ServicesState {}

class ServicesLoaded extends ServicesState {
  final ServicesModel servicesModel;
  ServicesLoaded({required this.servicesModel});
}

class ServicesError extends ServicesState {}
