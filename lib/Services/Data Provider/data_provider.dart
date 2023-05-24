import 'dart:convert';

import 'package:fyp/SharedPreference/sharedPreference.dart';
import 'package:fyp/UI/Forgot%20Password/verifyEmail.dart';
import 'package:http/http.dart' as http;

class DataProvider {
  var url = 'https://andrew-api-production.up.railway.app';
  var token = UserPreferences.getToken();

  Future<http.Response> login(
      {required String email, required String password}) {
    var response = http
        .post(Uri.parse('$url/api/users/signin'),
            headers: <String, String>{
              'Content-Type': 'application/json',
            },
            body: jsonEncode(
                <String, String>{"email": email, "password": password}))
        .timeout(
      const Duration(seconds: 15),
      onTimeout: () {
        // Time has run out, do what you wanted to do.
        return http.Response(
            'Error', 400); // Request Timeout response status code
      },
    );

    return response;
  }

  Future<http.Response> signup(
      {required String email,
      required String password,
      required String fName,
      required String lName,
      required String phone}) {
    var response = http
        .post(Uri.parse('$url/api/users/signup'),
            headers: <String, String>{
              'Content-Type': 'application/json',
            },
            body: jsonEncode(<String, String>{
              "email": email,
              "firstName": fName,
              "lastName": lName,
              "phone": phone,
              "password": password
            }))
        .timeout(
      const Duration(seconds: 15),
      onTimeout: () {
        // Time has run out, do what you wanted to do.
        return http.Response(
            'Error', 400); // Request Timeout response status code
      },
    );

    return response;
  }

  Future<http.Response> verifyEmail({
    required String email,
  }) {
    var response = http
        .post(Uri.parse('$url/api/users/forgot-password'),
            headers: <String, String>{
              'Content-Type': 'application/json',
            },
            body: jsonEncode(<String, String>{
              "email": email,
            }))
        .timeout(
      const Duration(seconds: 15),
      onTimeout: () {
        // Time has run out, do what you wanted to do.
        return http.Response(
            'Error', 400); // Request Timeout response status code
      },
    );

    return response;
  }

  Future<http.Response> verifyOTP({required String email, required int OTP}) {
    var response = http
        .post(Uri.parse('$url/api/users/verify-otp'),
            headers: <String, String>{
              'Content-Type': 'application/json',
            },
            body: jsonEncode(<String, dynamic>{"email": email, "otp": OTP}))
        .timeout(
      const Duration(seconds: 15),
      onTimeout: () {
        // Time has run out, do what you wanted to do.
        return http.Response(
            'Error', 400); // Request Timeout response status code
      },
    );

    return response;
  }

  Future<http.Response> resetPass(
      {required String email, required String password}) {
    var response = http
        .post(Uri.parse('$url/api/users/reset-password'),
            headers: <String, String>{
              'Content-Type': 'application/json',
            },
            body: jsonEncode(
                <String, dynamic>{"email": email, "password": password}))
        .timeout(
      const Duration(seconds: 15),
      onTimeout: () {
        // Time has run out, do what you wanted to do.
        return http.Response(
            'Error', 400); // Request Timeout response status code
      },
    );

    return response;
  }

  Future<http.Response> getPharmacy() {
    var response = http.get(
      Uri.parse('$url/api/pharmacy'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      },
    ).timeout(
      const Duration(seconds: 15),
      onTimeout: () {
        // Time has run out, do what you wanted to do.
        return http.Response(
            'Error', 400); // Request Timeout response status code
      },
    );

    return response;
  }

  Future<http.Response> postFavourites(String id) {
    var response = http.post(
      Uri.parse('$url/api/doctor/favourite-doctor/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      },
    ).timeout(
      const Duration(seconds: 15),
      onTimeout: () {
        // Time has run out, do what you wanted to do.
        return http.Response(
            'Error', 400); // Request Timeout response status code
      },
    );

    return response;
  }

  Future<http.Response> postFeedback(
      String name, String email, String phone, String message) {
    var response = http
        .post(Uri.parse('$url/api/feedback/create-feedback'),
            headers: <String, String>{
              'Content-Type': 'application/json',
              'Authorization': 'Bearer $token'
            },
            body: jsonEncode(<String, String>{
              "email": email,
              "name": name,
              "phone": phone,
              "message": message
            }))
        .timeout(
      const Duration(seconds: 15),
      onTimeout: () {
        // Time has run out, do what you wanted to do.
        return http.Response(
            'Error', 400); // Request Timeout response status code
      },
    );

    return response;
  }

  Future<http.Response> getFavourites() {
    var response = http.get(
      Uri.parse('$url/api/doctor/favourite'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      },
    ).timeout(
      const Duration(seconds: 15),
      onTimeout: () {
        // Time has run out, do what you wanted to do.
        return http.Response(
            'Error', 400); // Request Timeout response status code
      },
    );

    return response;
  }

  Future<http.Response> getDesignation() {
    var response = http.get(
      Uri.parse('$url/api/designation'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      },
    ).timeout(
      const Duration(seconds: 15),
      onTimeout: () {
        // Time has run out, do what you wanted to do.
        return http.Response(
            'Error', 400); // Request Timeout response status code
      },
    );

    return response;
  }

  Future<http.Response> getServices() {
    var response = http.get(
      Uri.parse('$url/api/services/'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      },
    ).timeout(
      const Duration(seconds: 15),
      onTimeout: () {
        // Time has run out, do what you wanted to do.
        return http.Response(
            'Error', 400); // Request Timeout response status code
      },
    );

    return response;
  }

  Future<http.Response> getReport() {
    var response = http.get(
      Uri.parse('$url/api/report/generate-report'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      },
    ).timeout(
      const Duration(seconds: 15),
      onTimeout: () {
        // Time has run out, do what you wanted to do.
        return http.Response(
            'Error', 400); // Request Timeout response status code
      },
    );

    return response;
  }

  Future<http.Response> getDoctor() {
    var response = http.get(
      Uri.parse('$url/api/doctor'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      },
    ).timeout(
      const Duration(seconds: 15),
      onTimeout: () {
        // Time has run out, do what you wanted to do.
        return http.Response(
            'Error', 400); // Request Timeout response status code
      },
    );

    return response;
  }

  Future<http.Response> getAppointment() {
    var response = http.get(
      Uri.parse('$url/api/appointment'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      },
    ).timeout(
      const Duration(seconds: 15),
      onTimeout: () {
        // Time has run out, do what you wanted to do.
        return http.Response(
            'Error', 400); // Request Timeout response status code
      },
    );

    return response;
  }

  Future<http.Response> getNews() {
    var response = http.get(
      Uri.parse('$url/api/news/'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      },
    ).timeout(
      const Duration(seconds: 15),
      onTimeout: () {
        // Time has run out, do what you wanted to do.
        return http.Response(
            'Error', 400); // Request Timeout response status code
      },
    );

    return response;
  }

  Future<http.Response> postAppointment(
      String name,
      String phone,
      String gender,
      String age,
      String city,
      String address,
      String doctorName,
      String designation,
      String instructions,
      String appointmentDate) {
    var response = http
        .post(Uri.parse('$url/api/appointment/create-appointment'),
            headers: <String, String>{
              'Content-Type': 'application/json',
              'Authorization': 'Bearer $token'
            },
            body: jsonEncode(<String, dynamic>{
              "department": designation,
              "doctorName": doctorName,
              "patientName": name,
              "phone": phone,
              "gender": gender,
              "age": age,
              "city": city,
              "address": address,
              "instructions": instructions,
              "appointmentDate": appointmentDate
            }))
        .timeout(
      const Duration(seconds: 15),
      onTimeout: () {
        // Time has run out, do what you wanted to do.
        return http.Response(
            'Error', 400); // Request Timeout response status code
      },
    );

    return response;
  }
}
