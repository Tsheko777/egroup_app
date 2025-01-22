import 'package:egroup_app/components/common/phoneinput.dart';
import 'package:egroup_app/components/common/text.dart';
import 'package:egroup_app/components/common/textinput.dart';
import 'package:flutter/material.dart';

class RegisterDetails1 extends StatefulWidget {
  final TextEditingController accountNumber;
  final TextEditingController email;
  final TextEditingController firstName;
  final TextEditingController lastName;
  final TextEditingController cellNumber;
  final TextEditingController province;

  const RegisterDetails1(
      {super.key,
      required this.accountNumber,
      required this.firstName,
      required this.lastName,
      required this.cellNumber,
      required this.province,
      required this.email});

  @override
  State<RegisterDetails1> createState() => _RegisterDetails1State();
}

class _RegisterDetails1State extends State<RegisterDetails1> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(
          children: [
            CText(
              text: "Email Address",
              color: Colors.black,
            )
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          children: [
            CPhone(
              text: "Email Address",
              icon: Icons.email,
              obscure: false,
              controller: widget.email,
            )
          ],
        ),
        const Row(
          children: [
            CText(
              text: "Account Number",
              color: Colors.black,
            )
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          children: [
            CPhone(
              text: "Account Number",
              icon: Icons.numbers,
              obscure: false,
              controller: widget.accountNumber,
            )
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        const Row(
          children: [
            CText(
              text: "Firstname",
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
              text: "Firstname",
              icon: Icons.account_circle_outlined,
              obscure: false,
              controller: widget.firstName,
            )
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        const Row(
          children: [
            CText(
              text: "Lastname",
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
              text: "Lastname",
              icon: Icons.account_circle_outlined,
              obscure: false,
              controller: widget.lastName,
            )
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        const Row(
          children: [
            CText(
              text: "Cell Number",
              color: Colors.black,
            )
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          children: [
            CPhone(
              text: "Cell Number",
              icon: Icons.phone_android,
              obscure: false,
              controller: widget.cellNumber,
            )
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        const Row(
          children: [
            CText(
              text: "Province",
              color: Colors.black,
            )
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          children: [
            CPhone(
              text: "Province",
              icon: Icons.place,
              obscure: false,
              controller: widget.province,
            )
          ],
        ),
        const SizedBox(
          height: 5,
        ),
      ],
    );
  }
}
