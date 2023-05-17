import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fyp/Logic/Designation_bloc/designation_bloc.dart';
import 'package:fyp/Logic/FavList_bloc/fav_list_bloc.dart';
import 'package:fyp/Logic/Fav_bloc/fav_bloc.dart';
import 'package:fyp/Logic/Feedback_bloc/feedback_bloc.dart';
import 'package:fyp/Logic/OTP_bloc/bloc/otp_bloc.dart';
import 'package:fyp/Logic/Pharmacy_bloc/bloc/pharmacy_bloc.dart';
import 'package:fyp/Logic/Report_bloc/report_bloc.dart';
import 'package:fyp/Logic/Reset_bloc/bloc/reset_bloc.dart';
import 'package:fyp/Logic/Services_bloc/services_bloc.dart';
import 'package:fyp/Logic/SignUp_bloc/sign_up_bloc.dart';
import 'package:fyp/Logic/VerifyEmail_bloc/bloc/verify_email_bloc.dart';

import 'package:fyp/splashscreen.dart';
import 'package:sizer/sizer.dart';

import 'Logic/Appointment_bloc/bloc/appointment_bloc.dart';
import 'Logic/CreateAppointment_bloc/bloc/create_appointment_bloc.dart';
import 'Logic/Doctor_bloc/bloc/doctor_bloc.dart';
import 'Logic/Login_bloc/login_bloc.dart';
import 'Logic/News_bloc/news_bloc.dart';
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
        BlocProvider<NewsBloc>(
          create: (BuildContext context) => NewsBloc(
              apiRepository: ApiRepository(dataService: DataProvider())),
        ),
        BlocProvider<ReportBloc>(
          create: (BuildContext context) => ReportBloc(
              apiRepository: ApiRepository(dataService: DataProvider())),
        ),
        BlocProvider<FeedbackBloc>(
          create: (BuildContext context) => FeedbackBloc(
              apiRepository: ApiRepository(dataService: DataProvider())),
        ),
        BlocProvider<DesignationBloc>(
          create: (BuildContext context) => DesignationBloc(
              apiRepository: ApiRepository(dataService: DataProvider())),
        ),
        BlocProvider<VerifyEmailBloc>(
          create: (BuildContext context) => VerifyEmailBloc(),
        ),
        BlocProvider<OtpBloc>(
          create: (BuildContext context) => OtpBloc(),
        ),
        BlocProvider<ResetBloc>(
          create: (BuildContext context) => ResetBloc(),
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
