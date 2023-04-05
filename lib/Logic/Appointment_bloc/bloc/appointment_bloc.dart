import 'package:bloc/bloc.dart';
import 'package:fyp/Services/Data%20Provider/apiRepository.dart';
import 'package:fyp/Services/Model/appointment_model.dart';
import 'package:meta/meta.dart';

part 'appointment_event.dart';
part 'appointment_state.dart';

class AppointmentBloc extends Bloc<AppointmentEvent, AppointmentState> {
  final ApiRepository apiRepository;

  AppointmentBloc({required this.apiRepository}) : super(AppointmentInitial()) {
    on<OnAppointmentLoad>((event, emit) async {
      emit(AppointmentInitial());
      try {
        emit(AppointmentLoading());
        var data = await apiRepository.getAppointment();
        emit(AppointmentLoaded(appointmentModel: data));
      } catch (e) {
        print(e);
        emit(AppointmentError());
      }
    });
  }
}
