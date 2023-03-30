import 'dart:convert';

import 'package:fyp/Logic/SignUp_bloc/sign_up_bloc.dart';
import 'package:fyp/Services/Model/signup_model.dart';
import 'package:http/http.dart';

import '../Model/login_model.dart';
import '../Model/pharmacy_model.dart';
import 'data_provider.dart';

class ApiRepository {
  final DataProvider dataService;
  ApiRepository({
    required this.dataService,
  });
  //Call this function to check status code and get the response body
  Future<dynamic> responseBody(
      {var parameters, required Response response}) async {
    var allModel;
    print(response.statusCode);
    try {
      if (response.statusCode == 200 || response.statusCode == 201) {
        allModel = jsonDecode(response.body);
        print(allModel);
      }
    } catch (e) {
      print(e);
    }

    return allModel;
  }

  Future<LoginModel> getAuthenticationData({
    required String username,
    required String password,
  }) async {
    var loginModel;

    loginModel = await LoginModel.fromJson(await responseBody(
        response:
            await dataService.login(email: username, password: password)));
    return loginModel;
  }

  Future<SignUpModel> getSignUpData({
    required String email,
    required String password,
    required String fName,
    required String lName,
    required String phone,
  }) async {
    var loginModel;

    loginModel = await SignUpModel.fromJson(await responseBody(
        response: await dataService.signup(
            email: email,
            fName: fName,
            lName: lName,
            phone: phone,
            password: password)));
    return loginModel;
  }

  Future<PharmacyModel> getPharmacy() async {
    var pharmacyModel;

    pharmacyModel = await PharmacyModel.fromJson(
        await responseBody(response: await dataService.getPharmacy()));
    return pharmacyModel;
  }
}
