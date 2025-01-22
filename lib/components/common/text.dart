import 'package:flutter/material.dart';

class CText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  final FontWeight fontWeight;
  final TextAlign align;
  final TextDecoration decoration;

  const CText({
    super.key,
    required this.text,
    this.fontSize = 14,
    this.align = TextAlign.start,
    this.color = Colors.black,
    this.decoration = TextDecoration.none,
    this.fontWeight = FontWeight.normal,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: align,
      text,
      style: TextStyle(
        decorationThickness: 1.3,
        decorationColor: Colors.white,
        fontSize: fontSize,
        color: color,
        fontWeight: fontWeight,
        decoration: decoration,
      ),
    );
  }
}
