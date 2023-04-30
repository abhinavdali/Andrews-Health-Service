import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:fyp/Services/Data%20Provider/apiRepository.dart';
import 'package:fyp/Services/Model/services_model.dart';
import 'package:meta/meta.dart';

part 'services_event.dart';
part 'services_state.dart';

class ServicesBloc extends Bloc<ServicesEvent, ServicesState> {
  final ApiRepository apiRepository;
  ServicesBloc({required this.apiRepository}) : super(ServicesInitial()) {
    on<OnServicesLoad>((event, emit) async {
      try{
        emit(ServicesLoading());
        var data = await apiRepository.getServices();
        emit(ServicesLoaded(servicesModel: data));
      }catch(e){
        print(e);
        emit(ServicesError());
      }
    });
  }
}
