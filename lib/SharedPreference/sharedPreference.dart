import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static SharedPreferences? _pref;

  static const _token = "TOKEN";

  static Future init() async => _pref = await SharedPreferences.getInstance();
  static Future setToken(String token) async {
    await _pref?.setString(_token, token);
  }

  static String? getToken() => _pref?.getString(_token);

  //delete
  static Future logout() async {
    await _pref?.remove(_token);
  }
}
