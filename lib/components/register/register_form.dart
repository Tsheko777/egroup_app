import 'package:egroup_app/components/common/button.dart';
import 'package:egroup_app/components/common/text.dart';
import 'package:egroup_app/components/register/register_form1.dart';
import 'package:egroup_app/components/register/register_form2.dart';
import 'package:egroup_app/logic/register_logic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class RegisterForm extends StatefulWidget {
  final Function setLoading;
  final Function setError;
  final String error;
  final bool loading;

  final TextEditingController email;
  final TextEditingController accountNumber;
  final TextEditingController firstName;
  final TextEditingController lastName;
  final TextEditingController cellNumber;
  final TextEditingController province;
  final TextEditingController surburb;
  final TextEditingController city;
  final TextEditingController streetNumber;
  final TextEditingController streetName;
  final TextEditingController idNumber;
  final TextEditingController password;
  final TextEditingController password2;

  const RegisterForm({
    super.key,
    required this.setLoading,
    required this.setError,
    required this.error,
    required this.email,
    required this.accountNumber,
    required this.firstName,
    required this.lastName,
    required this.cellNumber,
    required this.province,
    required this.surburb,
    required this.city,
    required this.streetNumber,
    required this.streetName,
    required this.idNumber,
    required this.password,
    required this.password2,
    required this.loading,
  });

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 100,
          ),
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
                fontSize: 25,
                fontWeight: FontWeight.bold,
                text: "Create Account",
                color: Colors.black87,
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          RegisterDetails1(
            email: widget.email,
            accountNumber: widget.accountNumber,
            firstName: widget.firstName,
            lastName: widget.lastName,
            cellNumber: widget.cellNumber,
            province: widget.province,
          ),
          RegisterDetails(
            surburb: widget.surburb,
            city: widget.city,
            streetNumber: widget.streetNumber,
            streetName: widget.streetName,
            idNumber: widget.idNumber,
            password2: widget.password2,
            password: widget.password,
          ),
          widget.error != ""
              ? Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: CText(
                          text: widget.error,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ],
                )
              : const SizedBox(),
          const SizedBox(
            height: 15,
          ),
          widget.loading
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
                  text: "Register",
                  onPressed: () {
                    RegisterLogic().register(
                      context,
                      widget.email,
                      widget.accountNumber,
                      widget.firstName,
                      widget.lastName,
                      widget.cellNumber,
                      widget.province,
                      widget.surburb,
                      widget.city,
                      widget.streetNumber,
                      widget.streetName,
                      widget.idNumber,
                      widget.password,
                      widget.password2,
                      widget.setError,
                      widget.setLoading,
                    );
                  },
                ),
              )
            ],
          ),
          const SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}
