import 'package:dio/dio.dart';
import 'package:egroup_app/service/const.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRequest {
  static final Dio authRequest = Dio();

  static init() async {
    var url = "$BACKEND/api";
    var token = await getToken();

    authRequest.options
      ..headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      }
      ..baseUrl = url;
  }

  static getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token");
    return token;
  }
}
