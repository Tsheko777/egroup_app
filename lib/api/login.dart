// ignore_for_file: use_build_context_synchronously

import 'package:dio/dio.dart';
import 'package:egroup_app/service/guest_request.dart';
import 'package:egroup_app/state/gerneral_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginRequest {
  login(
    var loginData,
    BuildContext context,
  ) async {
    Response response;
    try {
      response =
          await GuestRequest.guestRequest.post('/login', data: loginData);
      context.read<GerneralState>().setLoading(false);
      context.read<GerneralState>().setError("");
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString("token", response.data['token']);
      String? token = prefs.getString("token");
      if (token != null) {
        Navigator.pushReplacementNamed(
          context,
          '/dashboard',
        );
      }
      return "";
    } on DioException catch (dioError) {
      context.read<GerneralState>().setLoading(false);
      // Handle Dio HTTP errors (e.g., 404, 500)
      if (dioError.response?.statusCode == 422) {
        context.read<GerneralState>().error =
            dioError.response?.data['message'];
        return dioError.response?.data['message'];
      } else if (dioError.response?.statusCode == 302) {
        context.read<GerneralState>().setError("");
        Navigator.pushNamed(context, '/dashboard');
      } else {
        context
            .read<GerneralState>()
            .setError("Error : please contact webmaster");
      }
      return "";
    }
  }
}
