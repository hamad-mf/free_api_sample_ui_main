import 'package:shared_preferences/shared_preferences.dart';

class AppUtils {
  static Future<String> getStoredAccessToken() async {
    //shared preference  onj
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //get stored token
    String storedtoken = prefs.getString("access") ?? "";
    return storedtoken;
  }
}
