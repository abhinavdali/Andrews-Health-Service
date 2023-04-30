import 'dart:convert';

import 'package:fyp/SharedPreference/sharedPreference.dart';
import 'package:http/http.dart' as http;

class DataProvider {
  var url = 'https://andrews-dipeshshtha4.b4a.run/';
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
