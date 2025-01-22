import 'package:egroup_app/components/common/text.dart';
import 'package:flutter/material.dart';

class CButton extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  final Color bgColor;
  final FontWeight fontWeight;
  final dynamic onPressed;

  const CButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.fontSize = 14,
    this.color = Colors.white,
    this.fontWeight = FontWeight.normal,
    this.bgColor = Colors.orange,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          foregroundColor: color,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(5))),
          fixedSize: const Size(double.infinity, 46),
          backgroundColor: bgColor),
      child: CText(
        text: text,
        color: color,
        fontWeight: fontWeight,
      ),
    );
  }
}
