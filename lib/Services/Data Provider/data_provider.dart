import 'dart:convert';

import 'package:http/http.dart' as http;

class DataProvider {
  var url = 'https://andrews-health-services-production.up.railway.app';

  Future<http.Response> login({required String  email,required String password}) {
    var response = http.post(Uri.parse('$url/api/users/signin'),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body:
      jsonEncode(
          <String, String>{"email": email, "password": password})
    ).timeout(
        const Duration(seconds: 15),
        onTimeout: () {
      // Time has run out, do what you wanted to do.
      return http.Response(
          'Error', 400); // Request Timeout response status code
    },);

    return response;
  }

  Future<http.Response> signup({required String  email,required String password,required String fName, required String lName,required String phone}) {
    var response = http.post(Uri.parse('$url/api/users/signup'),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body:
        jsonEncode(
            <String, String>{
              "email": email,
              "firstName" : fName,
              "lastName" : lName,
              "phone" : phone,
              "password": password})
    ).timeout(
      const Duration(seconds: 15),
      onTimeout: () {
        // Time has run out, do what you wanted to do.
        return http.Response(
            'Error', 400); // Request Timeout response status code
      },);

    return response;
  }
}
