import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:fyp/Services/Data%20Provider/apiRepository.dart';
import 'package:meta/meta.dart';

import '../../Services/Model/favList_model.dart';

part 'fav_list_event.dart';
part 'fav_list_state.dart';

class FavListBloc extends Bloc<FavListEvent, FavListState> {
  final ApiRepository apiRepository;

  FavListBloc({required this.apiRepository}) : super(FavListInitial()) {
    on<OnFavListLoad>((event, emit) async {
      try{
        emit(FavListLoading());
        var data = await apiRepository.getFavorites();
        emit(FavListLoaded(favModel: data));
      }catch(e){
        emit(FavListError());
      }
    });
  }
}
