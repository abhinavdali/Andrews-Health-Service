import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fyp/Logic/FavList_bloc/fav_list_bloc.dart';
import 'package:fyp/Logic/Fav_bloc/fav_bloc.dart';
import 'package:fyp/Logic/Pharmacy_bloc/bloc/pharmacy_bloc.dart';
import 'package:fyp/Logic/Services_bloc/services_bloc.dart';
import 'package:fyp/Logic/SignUp_bloc/sign_up_bloc.dart';

import 'package:fyp/splashscreen.dart';
import 'package:sizer/sizer.dart';

import 'Logic/Appointment_bloc/bloc/appointment_bloc.dart';
import 'Logic/CreateAppointment_bloc/bloc/create_appointment_bloc.dart';
import 'Logic/Doctor_bloc/bloc/doctor_bloc.dart';
import 'Logic/Login_bloc/login_bloc.dart';
import 'Services/Data Provider/apiRepository.dart';
import 'Services/Data Provider/data_provider.dart';
import 'SharedPreference/sharedPreference.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await UserPreferences.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(
          create: (BuildContext context) => LoginBloc(
              apiRepository: ApiRepository(dataService: DataProvider())),
        ),
        BlocProvider<SignUpBloc>(
          create: (BuildContext context) => SignUpBloc(
              apiRepository: ApiRepository(dataService: DataProvider())),
        ),
        BlocProvider<PharmacyBloc>(
          create: (BuildContext context) => PharmacyBloc(
              apiRepository: ApiRepository(dataService: DataProvider())),
        ),
        BlocProvider<DoctorBloc>(
          create: (BuildContext context) => DoctorBloc(
              apiRepository: ApiRepository(dataService: DataProvider())),
        ),
        BlocProvider<AppointmentBloc>(
          create: (BuildContext context) => AppointmentBloc(
              apiRepository: ApiRepository(dataService: DataProvider())),
        ),
        BlocProvider<CreateAppointmentBloc>(
          create: (BuildContext context) => CreateAppointmentBloc(
              apiRepository: ApiRepository(dataService: DataProvider())),
        ),
        BlocProvider<FavBloc>(
          create: (BuildContext context) => FavBloc(
              apiRepository: ApiRepository(dataService: DataProvider())),
        ),
        BlocProvider<FavListBloc>(
          create: (BuildContext context) => FavListBloc(
              apiRepository: ApiRepository(dataService: DataProvider())),
        ),
        BlocProvider<ServicesBloc>(
          create: (BuildContext context) => ServicesBloc(
              apiRepository: ApiRepository(dataService: DataProvider())),
        ),
      ],
      child: Sizer(builder: (context, orientation, deviceType) {
        return const MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              body: SplashScreen(),
            ));
      }),
    );
  }
}
