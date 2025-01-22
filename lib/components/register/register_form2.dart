import 'package:egroup_app/components/common/phoneinput.dart';
import 'package:egroup_app/components/common/text.dart';
import 'package:egroup_app/components/common/textinput.dart';
import 'package:flutter/material.dart';

class RegisterDetails extends StatefulWidget {
  final TextEditingController surburb;
  final TextEditingController city;
  final TextEditingController streetNumber;
  final TextEditingController streetName;
  final TextEditingController idNumber;
  final TextEditingController password;
  final TextEditingController password2;
  const RegisterDetails({
    super.key,
    required this.surburb,
    required this.city,
    required this.streetNumber,
    required this.streetName,
    required this.idNumber,
    required this.password,
    required this.password2,
  });

  @override
  State<RegisterDetails> createState() => _RegisterDetailsState();
}

class _RegisterDetailsState extends State<RegisterDetails> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(
          children: [
            CText(
              text: "Surburb",
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
              text: "Surburb",
              icon: Icons.place,
              obscure: false,
              controller: widget.surburb,
            )
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        const Row(
          children: [
            CText(
              text: "City",
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
              text: "City",
              icon: Icons.place,
              obscure: false,
              controller: widget.city,
            )
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        const Row(
          children: [
            CText(
              text: "Street Number",
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
              text: "Street Number",
              icon: Icons.place,
              obscure: false,
              controller: widget.streetNumber,
            )
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        const Row(
          children: [
            CText(
              text: "Street Name",
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
              text: "Street Name",
              icon: Icons.place,
              obscure: false,
              controller: widget.streetName,
            )
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        const Row(
          children: [
            CText(
              text: "ID Number",
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
              text: "ID Number",
              icon: Icons.person,
              obscure: false,
              controller: widget.idNumber,
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
            CPhone(
              text: "*******",
              icon: Icons.lock,
              obscure: true,
              controller: widget.password,
            )
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        const Row(
          children: [
            CText(
              text: "Confirm Password",
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
              controller: widget.password2,
            )
          ],
        ),
      ],
    );
  }
}
