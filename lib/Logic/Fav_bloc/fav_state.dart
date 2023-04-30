part of 'fav_bloc.dart';

@immutable
abstract class FavState {}

class FavInitial extends FavState {}

class FavLoaded extends FavState {
  final FavModel favModel;
  FavLoaded({required this.favModel});
}

class FavLoading extends FavState {}

class FavError extends FavState {}



