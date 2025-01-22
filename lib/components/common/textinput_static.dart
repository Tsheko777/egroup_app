import 'package:flutter/material.dart';

class CInputStatic extends StatefulWidget {
  final String text;
  final IconData icon;
  final bool obscure;
  final dynamic controller;
  final Color fillColor;

  const CInputStatic(
      {super.key,
      this.fillColor = const Color.fromRGBO(26, 28, 30, 1),
      required this.text,
      required this.icon,
      required this.obscure,
      required this.controller});

  @override
  State<CInputStatic> createState() => _CInputStaticState();
}

class _CInputStaticState extends State<CInputStatic> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50, // Set the desired height
      child: TextField(
        enabled: false,
        controller: widget.controller,
        obscureText: widget.obscure,
        style: const TextStyle(fontSize: 15, color: Colors.white),
        decoration: InputDecoration(
          enabled: false,
          contentPadding: const EdgeInsets.only(right: 15),
          hoverColor: Colors.transparent,
          filled: true,
          fillColor: widget.fillColor,
          prefixIcon: Icon(
            widget.icon,
            size: 18,
            color: Colors.white,
          ),
          hintText: widget.text,
          hintStyle: const TextStyle(fontSize: 14, color: Colors.grey),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: widget.fillColor,
              style: BorderStyle.solid,
              width: 1,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: widget.fillColor,
              style: BorderStyle.solid,
              width: 1,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
        ),
      ),
    );
  }
}
