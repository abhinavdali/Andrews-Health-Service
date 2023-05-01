import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:fyp/Services/Data%20Provider/apiRepository.dart';
import 'package:fyp/Services/Model/report_model.dart';

part 'report_event.dart';
part 'report_state.dart';

class ReportBloc extends Bloc<ReportEvent, ReportState> {
  final ApiRepository apiRepository;
  ReportBloc({required this.apiRepository}) : super(ReportInitial()) {
    on<OnReportLoad>((event, emit) async {
      try{
        emit(ReportLoading());
        var data = await apiRepository.getReport();
        emit(ReportLoaded(reportModel: data));
      }catch(e){
        print(e);
        emit(ReportError());
      }

    });
  }
}
