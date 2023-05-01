part of 'report_bloc.dart';

abstract class ReportState  {}

class ReportInitial extends ReportState {}

class ReportLoading extends ReportState {}

class ReportLoaded extends ReportState {
  final ReportModel reportModel;
  ReportLoaded({required this.reportModel});
}

class ReportError extends ReportState {}
