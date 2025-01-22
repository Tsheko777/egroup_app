import 'package:flutter/material.dart';

class CPhone extends StatefulWidget {
  final String text;
  final IconData icon;
  final bool obscure;
  final dynamic controller;
  final Color fillColor;

  const CPhone(
      {super.key,
      this.fillColor = const Color.fromRGBO(0, 0, 0, 0.05),
      required this.text,
      required this.icon,
      required this.obscure,
      required this.controller});

  @override
  State<CPhone> createState() => _CPhoneState();
}

class _CPhoneState extends State<CPhone> {
  bool value = false;
  bool isValue = false;

  updateValue() {
    if (widget.controller.text.isNotEmpty) {
      setState(() {
        isValue = true;
      });
    } else {
      setState(() {
        isValue = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    updateValue();
    return Expanded(
      child: SizedBox(
        height: 50, // Set the desired height
        child: TextField(
          keyboardType: TextInputType.phone,
          controller: widget.controller,
          obscureText: widget.obscure,
          style: const TextStyle(fontSize: 14, color: Colors.black),
          onTap: () {
            setState(() {
              updateValue();
            });
          },
          onChanged: (value) {
            setState(() {
              updateValue();
            });
          },
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(right: 15),
            hoverColor: Colors.transparent,
            filled: true,
            fillColor: widget.fillColor,
            prefixIcon: Icon(
              widget.icon,
              size: 18,
              color: Colors.grey,
            ),
            labelText: isValue ? null : widget.text,
            labelStyle: const TextStyle(fontSize: 14, color: Colors.grey),
            border: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.transparent,
                style: BorderStyle.solid,
                width: 1,
              ),
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.transparent,
                style: BorderStyle.solid,
                width: 1,
              ),
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
          ),
        ),
      ),
    );
  }
}
