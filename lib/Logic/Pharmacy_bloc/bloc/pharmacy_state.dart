part of 'pharmacy_bloc.dart';

@immutable
abstract class PharmacyState {}

class PharmacyInitial extends PharmacyState {}

class PharmacyLoading extends PharmacyState {}

class PharmacyLoaded extends PharmacyState {
  final PharmacyModel pharmacyModel;
  PharmacyLoaded({required this.pharmacyModel});
}

class PharmacyError extends PharmacyState {}
