import 'package:flutter/material.dart';

class TextTitle extends StatelessWidget {
  final String title;
  final Color color;
  final double fontSize;
  const TextTitle(
      {super.key,
      required this.title,
      required this.fontSize,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: TextAlign.center,
      style: TextStyle(
          color: color,
          fontFamily: "ArbFONTS-Almarai-Bold",
          fontWeight: FontWeight.bold,
          fontSize: fontSize),
    );
  }
}
