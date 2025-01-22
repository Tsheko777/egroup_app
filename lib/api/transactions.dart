// ignore_for_file: empty_catche, use_build_context_synchronously
import 'package:egroup_app/components/common/text.dart';
import 'package:egroup_app/service/auth_request.dart';
import 'package:egroup_app/state/gerneral_state.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class TransactionRequest {
  transactions(context) async {
    Response response;
    try {
      await AuthRequest.init();
      response = await AuthRequest.authRequest.get('/transactions');
      return response.data;
    } on DioException catch (dioError) {
      if (dioError.response != null) {
        Navigator.pushNamed(context, "/login");
      }
      if (dioError.response?.statusCode == 422) {
        return dioError.response?.data['message'];
      } else {
        return "Error : please contact webmaster";
      }
    }
  }

  transfer(BuildContext context, transferData, Function setLoading) async {
    Response response;
    Response transResponse;
    try {
      await AuthRequest.init();
      response =
          await AuthRequest.authRequest.post('/transfer', data: transferData);

      if (response.data != null) {
        transResponse = await AuthRequest.authRequest.get('/transactions');
        context.read<GerneralState>().setTransations(transResponse.data);
        setLoading(false);
      }

      Alert(
        context: context,
        type: AlertType.success,
        title: "Transfer",
        desc: "Electronic transfer completed",
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
      return "";
    } on DioException catch (dioError) {
      setLoading(false);
      if (dioError.response?.statusCode == 422) {
        return dioError.response?.data['message'];
      } else {
        return "Error : please contact webmaster";
      }
    }
  }
}
