part of 'designation_bloc.dart';

@immutable
abstract class DesignationState {}

class DesignationInitial extends DesignationState {}

class DesignationLoading extends DesignationState {}

class DesignationLoaded extends DesignationState {
  final DesignationModel designationModel;
  DesignationLoaded({required this.designationModel});
}

class DesignationError extends DesignationState {}
