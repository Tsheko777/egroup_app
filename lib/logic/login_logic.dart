import 'package:egroup_app/api/login.dart';
import 'package:egroup_app/state/gerneral_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginLogic {
  login(
    BuildContext context,
    TextEditingController username,
    TextEditingController password,
  ) async {
    if (username.text == "") {
      context.read<GerneralState>().setError("Please enter your username");
    } else if (password.text == "") {
      context.read<GerneralState>().setError("Please enter your password");
    } else {
      var data = {"email": username.text, "password": password.text};
      context.read<GerneralState>().setLoading(true);
      LoginRequest().login(data, context);
    }
  }
}
