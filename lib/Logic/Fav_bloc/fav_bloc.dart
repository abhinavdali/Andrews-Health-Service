

import 'package:bloc/bloc.dart';
import 'package:fyp/Services/Data%20Provider/apiRepository.dart';
import 'package:fyp/Services/Model/favList_model.dart';
import 'package:fyp/Services/Model/fav_model.dart';
import 'package:meta/meta.dart';

part 'fav_event.dart';
part 'fav_state.dart';

class FavBloc extends Bloc<FavEvent, FavState> {
  final ApiRepository apiRepository;
  FavBloc({required this.apiRepository}) : super(FavInitial()) {
    on<OnFav>((event, emit) async {
      try{
        emit(FavLoading());
        var data = await apiRepository.postFavorites(event.id);
        emit(FavLoaded(favModel: data));
      }catch(e){
        emit(FavError());
      }
    });


  }
}
