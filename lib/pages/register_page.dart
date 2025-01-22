import 'package:egroup_app/components/common/text.dart';
import 'package:egroup_app/components/register/register_form.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final email = TextEditingController();
  final accountNumber = TextEditingController();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final cellNumber = TextEditingController();
  final province = TextEditingController();
  final surburb = TextEditingController();
  final city = TextEditingController();
  final streetNumber = TextEditingController();
  final streetName = TextEditingController();
  final idNumber = TextEditingController();
  final password = TextEditingController();
  final password2 = TextEditingController();

  bool loading = false;

  setLoading(value) {
    setState(() {
      if (mounted) {
        loading = value;
      }
    });
  }

  String error = "";

  setError(value) {
    if (mounted) {
      setState(() {
        error = value;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          resizeToAvoidBottomInset: true,
          extendBodyBehindAppBar: true,
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: const CText(
              text: "Register",
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            leading: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(Icons.chevron_left, color: Colors.white)),
            backgroundColor: Colors.orange,
            scrolledUnderElevation: 0,
            /*  systemOverlayStyle: SystemUiOverlayStyle.dark, */
          ),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: RegisterForm(
                loading: loading,
                error: error,
                setError: setError,
                setLoading: setLoading,
                email: email,
                accountNumber: accountNumber,
                firstName: firstName,
                lastName: lastName,
                cellNumber: cellNumber,
                province: province,
                surburb: surburb,
                city: city,
                streetNumber: streetNumber,
                streetName: streetName,
                idNumber: idNumber,
                password: password,
                password2: password2,
              ),
            ),
          ),
        )
      ],
    );
  }
}
