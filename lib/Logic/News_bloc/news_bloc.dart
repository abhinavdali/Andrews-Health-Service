import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:fyp/Services/Data%20Provider/apiRepository.dart';
import 'package:meta/meta.dart';

import '../../Services/Model/news_model.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final ApiRepository apiRepository;
  NewsBloc({required this.apiRepository}) : super(NewsInitial()) {
    on<OnNewsLoad>((event, emit) async {
      try{

        emit(NewsLoading());
        var data =  await apiRepository.getNews();
        emit(NewsLoaded(newsModel: data));
      }catch(e){
        print(e);
        emit(NewsError());
      }

    });
  }
}
