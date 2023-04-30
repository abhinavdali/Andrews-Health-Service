part of 'fav_list_bloc.dart';

@immutable
abstract class FavListState {}


class FavListInitial extends FavListState {}

class FavListLoaded extends FavListState {
  final FavListModel favModel;
  FavListLoaded({required this.favModel});
}

class FavListLoading extends FavListState {}

class FavListError extends FavListState {}