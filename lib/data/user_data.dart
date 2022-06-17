import 'package:shared_preferences/shared_preferences.dart';

class UserSimplePreferences {
  static late SharedPreferences _preferences;
  static const String key = "UserData";

  static Future init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static Future setUserData(String data) async {
    _preferences.setString(key, data);
  }

  static String getUserdata() {
    return _preferences.getString(key) ?? "{}";
  }
}
