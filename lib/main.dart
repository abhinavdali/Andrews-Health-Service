import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fyp/Logic/SignUp_bloc/sign_up_bloc.dart';
import 'package:fyp/UI/loginandsignup/welcome.dart';
import 'package:sizer/sizer.dart';

import 'Logic/Login_bloc/login_bloc.dart';
import 'Services/Data Provider/apiRepository.dart';
import 'Services/Data Provider/data_provider.dart';

void main() {
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
      ],
      child:  Sizer(builder: (context, orientation, deviceType) {
        return const MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              body: Welcome(),
            ));
      }),
    );
  }
}
