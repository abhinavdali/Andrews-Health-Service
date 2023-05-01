import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:fyp/Services/Data%20Provider/apiRepository.dart';
import 'package:fyp/Services/Model/designation_model.dart';
import 'package:meta/meta.dart';

part 'designation_event.dart';
part 'designation_state.dart';

class DesignationBloc extends Bloc<DesignationEvent, DesignationState> {
  final ApiRepository apiRepository;

  DesignationBloc({required this.apiRepository}) : super(DesignationInitial()) {
    on<OnDesignationCall>((event, emit) async {
      try{
        emit(DesignationLoading());
        var data = await apiRepository.getDesignation();
        emit(DesignationLoaded(designationModel: data));
      }catch(e){
        print(e);
        emit(DesignationError());
      }
    });
  }
}
