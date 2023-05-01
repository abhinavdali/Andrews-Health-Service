import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static SharedPreferences? _pref;

  static const _token = "TOKEN";
  static const _name = "NAME";
  static const _email = "EMAIL";
  static const _phone = "PHONE";

  static Future init() async => _pref = await SharedPreferences.getInstance();
  static Future setToken(String token) async {
    await _pref?.setString(_token, token);
  }

  static Future setEmail(String email) async {
    await _pref?.setString(_email, email);
  }

  static Future setPhone(String phone) async {
    await _pref?.setString(_phone, phone);
  }
  static Future setName(String name) async {
    await _pref?.setString(_name, name);
  }

  static String? getToken() => _pref?.getString(_token);
  static String? getEmail() => _pref?.getString(_email);
  static String? getPhone() => _pref?.getString(_phone);
  static String? getName() => _pref?.getString(_name);


  //delete
  static Future logout() async {
    await _pref?.remove(_token);
  }
}
