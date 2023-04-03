import 'package:bloc/bloc.dart';
import 'package:fyp/Services/Data%20Provider/apiRepository.dart';
import 'package:fyp/Services/Model/doctor_model.dart';
import 'package:meta/meta.dart';

part 'doctor_event.dart';
part 'doctor_state.dart';

class DoctorBloc extends Bloc<DoctorEvent, DoctorState> {
  final ApiRepository apiRepository;
  DoctorBloc({required this.apiRepository}) : super(DoctorInitial()) {
    on<OnDoctorLoad>((event, emit) async {
      emit(DoctorInitial());
      try {
        emit(DoctorLoading());
        var data = await apiRepository.getDoctor();
        emit(DoctorLoaded(doctorModel: data));
      } catch (e) {
        print(e);
        emit(DoctorError());
      }
    });
  }
}
