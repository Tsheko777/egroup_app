import 'package:egroup_app/components/common/button.dart';
import 'package:egroup_app/components/common/text.dart';
import 'package:flutter/material.dart';

class OnBoardinPage extends StatefulWidget {
  const OnBoardinPage({super.key});

  @override
  State<OnBoardinPage> createState() => _OnBoardinPageState();
}

class _OnBoardinPageState extends State<OnBoardinPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          scrolledUnderElevation: 0,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CText(
                      text: "Welcome",
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    )
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                const Image(
                  image: AssetImage("assets/logo.png"),
                ),
                const Row(
                  children: [
                    Expanded(
                      child: CText(
                          text:
                              "Start your journey by logging in or creating a new account."),
                    )
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Expanded(
                        child: CButton(
                            text: "Login",
                            onPressed: () {
                              Navigator.pushNamed(context, "/login");
                            })),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Expanded(
                      child: CButton(
                          bgColor: Colors.blueAccent,
                          text: "Register",
                          onPressed: () {
                            Navigator.pushNamed(context, "/register");
                          }),
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
