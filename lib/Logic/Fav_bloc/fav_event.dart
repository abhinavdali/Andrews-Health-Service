part of 'fav_bloc.dart';

@immutable
abstract class FavEvent {}

class OnFav extends FavEvent{
  final String id;
  OnFav({required this.id});
}

