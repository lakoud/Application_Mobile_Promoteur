import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  final double letterSpacing;

  CustomText(this.text, this.color, this.fontSize, this.letterSpacing);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: fontSize,
          letterSpacing: letterSpacing,
        ),
      ),
    );
  }
}
