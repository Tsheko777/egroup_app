// ignore_for_file: empty_catche
import 'package:egroup_app/service/auth_request.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoggedRequest {
  isLogged(context) async {
    Response response;
    try {
      await AuthRequest.init();
      response = await AuthRequest.authRequest.get('/transactions');
      Navigator.pushReplacementNamed(context, '/dashboard');
      return response;
    } on DioException catch (dioError) {
      if (dioError.response != null) {
        Navigator.pushNamed(context, "/login");
      }
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString("token");
      if (token == "") {
        Navigator.pushReplacementNamed(context, "/onboarding"); //login
      } else {
        Navigator.pushReplacementNamed(context, "/onboarding");
      }
    }
  }
}
