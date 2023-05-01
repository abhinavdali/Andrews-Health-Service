import 'dart:convert';
import 'package:fyp/Logic/Feedback_bloc/feedback_bloc.dart';
import 'package:fyp/Services/Model/appointment_model.dart';
import 'package:fyp/Services/Model/create_appointment_model.dart';
import 'package:fyp/Services/Model/designation_model.dart';
import 'package:fyp/Services/Model/fav_model.dart';
import 'package:fyp/Services/Model/feedback_model.dart';
import 'package:fyp/Services/Model/report_model.dart';
import 'package:fyp/Services/Model/services_model.dart';
import 'package:fyp/Services/Model/signup_model.dart';
import 'package:http/http.dart';
import '../Model/doctor_model.dart';
import '../Model/favList_model.dart';
import '../Model/login_model.dart';
import '../Model/news_model.dart';
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

  Future<FeedbackModel> postFeedback({
    required String email,
    required String phone,
    required String name,
    required String message,
  }) async {
    var feedbackModel;

    feedbackModel = await FeedbackModel.fromJson(await responseBody(
        response: await dataService.postFeedback(name, email, phone, message)));
    return feedbackModel;
  }

  Future<PharmacyModel> getPharmacy() async {
    var pharmacyModel;

    pharmacyModel = await PharmacyModel.fromJson(
        await responseBody(response: await dataService.getPharmacy()));
    return pharmacyModel;
  }


  Future<FavModel> postFavorites(String id) async {
    var favModel;

    favModel = await FavModel.fromJson(
        await responseBody(response: await dataService.postFavourites(id)));
    return favModel;
  }

  Future<FavListModel> getFavorites() async {
    var favModel;

    favModel = await FavListModel.fromJson(
        await responseBody(response: await dataService.getFavourites()));
    return favModel;
  }

  Future<DesignationModel> getDesignation() async {
    var designationModel;

    designationModel = await DesignationModel.fromJson(
        await responseBody(response: await dataService.getDesignation()));
    return designationModel;
  }

  Future<ServicesModel> getServices() async {
    var servicesModel;

    servicesModel = await ServicesModel.fromJson(
        await responseBody(response: await dataService.getServices()));
    return servicesModel;
  }

  Future<DoctorModel> getDoctor() async {
    var doctorModel;

    doctorModel = await DoctorModel.fromJson(
        await responseBody(response: await dataService.getDoctor()));
    return doctorModel;
  }

  Future<NewsModel> getNews() async {
    var newsModel;

    newsModel = await NewsModel.fromJson(
        await responseBody(response: await dataService.getNews()));
    return newsModel;
  }

  Future<ReportModel> getReport() async {
    var reportModel;

    reportModel = await ReportModel.fromJson(
        await responseBody(response: await dataService.getReport()));
    return reportModel;
  }

  Future<AppointmentModel> getAppointment() async {
    var doctorModel;

    doctorModel = await AppointmentModel.fromJson(
        await responseBody(response: await dataService.getAppointment()));
    return doctorModel;
  }

  Future<CreateAppointmentModel> postAppointment(
      String name,
      String phone,
      String gender,
      String age,
      String city,
      String address,
      String doctorName,
      String designation,
      String instructions,
      String appointmentDate) async {
    var doctorModel;

    doctorModel = await CreateAppointmentModel.fromJson(await responseBody(
        response: await dataService.postAppointment(
            name,
            phone,
            gender,
            age,
            city,
            address,
            doctorName,
            designation,
            instructions,
            appointmentDate)));
    return doctorModel;
  }
}
