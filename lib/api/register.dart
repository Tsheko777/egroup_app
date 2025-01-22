// ignore_for_file: use_build_context_synchronously

import 'package:dio/dio.dart';
import 'package:egroup_app/components/common/text.dart';
import 'package:egroup_app/service/guest_request.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class RegisterRequest {
  register(var loginData, BuildContext context, dynamic setLoading,
      Function setError) async {
    // ignore: unused_local_variable
    Response response;
    try {
      response =
          await GuestRequest.guestRequest.post('/register', data: loginData);
      setError("");
      setLoading(false);

      Alert(
        context: context,
        type: AlertType.success,
        title: "Account",
        desc: "Account has been created successfully",
        buttons: [
          DialogButton(
            color: Colors.green,
            highlightColor: Colors.green,
            onPressed: () =>
                Navigator.pushReplacementNamed(context, "/dashboard"),
            width: 120,
            child: const CText(
              color: Colors.white,
              text: "Done",
            ),
          )
        ],
      ).show();
      return "ok";
    } on DioException catch (dioError) {
      setLoading(false);
      // Handle Dio HTTP errors (e.g., 404, 500)
      if (dioError.response?.statusCode == 422) {
        setError(dioError.response?.data['message']);
        return dioError.response?.data['message'];
      } else if (dioError.response?.statusCode == 302) {
        setError("");
        //Navigator.pushNamed(context, '/dashboard');
      } else {
        setError("Error : please contact webmaster");
      }
    }
  }
}
