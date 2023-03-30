import 'package:bloc/bloc.dart';
import 'package:fyp/Services/Data%20Provider/apiRepository.dart';
import 'package:meta/meta.dart';

import '../../../Services/Model/pharmacy_model.dart';

part 'pharmacy_event.dart';
part 'pharmacy_state.dart';

class PharmacyBloc extends Bloc<PharmacyEvent, PharmacyState> {
  final ApiRepository apiRepository;
  PharmacyBloc({required this.apiRepository}) : super(PharmacyInitial()) {
    on<OnPharmacyLoad>((event, emit) async {
      emit(PharmacyInitial());
      try {
        emit(PharmacyLoading());
        var data = await apiRepository.getPharmacy();

        emit(PharmacyLoaded(pharmacyModel: data));
      } catch (e) {
        print(e);
        emit(PharmacyError());
      }
    });
  }
}
