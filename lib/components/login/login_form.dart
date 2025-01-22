import 'package:egroup_app/components/common/button.dart';
import 'package:egroup_app/components/common/text.dart';
import 'package:egroup_app/components/common/textinput.dart';
import 'package:egroup_app/logic/login_logic.dart';
import 'package:egroup_app/state/gerneral_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

class LoginForm extends StatefulWidget {
  final TextEditingController username;
  final TextEditingController password;

  const LoginForm({
    super.key,
    required this.username,
    required this.password,
  });

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Row(
          children: [
            CText(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                text: "Let's Get Started ")
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        const Row(
          children: [
            CText(
              text: "Email or Mobile",
              color: Colors.black,
            )
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          children: [
            CInput(
              text: "Email or Mobile",
              icon: Icons.email,
              obscure: false,
              controller: widget.username,
            )
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        const Row(
          children: [
            CText(
              text: "Password",
              color: Colors.black,
            )
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          children: [
            CInput(
              text: "*******",
              icon: Icons.lock,
              obscure: true,
              controller: widget.password,
            )
          ],
        ),
        context.watch<GerneralState>().error != ""
            ? Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: CText(
                      text: context.watch<GerneralState>().error,
                      color: Colors.red,
                    ),
                  ),
                ],
              )
            : const SizedBox(),
        const SizedBox(
          height: 15,
        ),
        context.watch<GerneralState>().loading
            ? const Padding(
                padding: EdgeInsets.only(bottom: 15),
                child: SpinKitThreeBounce(
                  color: Colors.orange,
                  size: 25,
                ),
              )
            : const SizedBox(),
        Row(
          children: [
            Expanded(
              child: CButton(
                text: "Login",
                onPressed: () {
                  LoginLogic().login(context, widget.username, widget.password);
                },
              ),
            )
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CText(
              text: "Don't have account? ",
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, "/register");
              },
              child: const CText(
                  fontWeight: FontWeight.bold,
                  color: Colors.orange,
                  text: "Register"),
            )
          ],
        )
      ],
    );
  }
}
