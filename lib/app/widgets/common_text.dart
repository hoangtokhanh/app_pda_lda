import 'package:flutter/material.dart';

class CommonText extends StatelessWidget {
  final String text;
  final TextStyle style;
  final Color? color;
  final FontWeight? fontWeight;
  final int? maxLines;
  final double? fontSize = 18;
  const CommonText({super.key, required this.text, required this.style, this.color, this.fontWeight, this.maxLines});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      style: style.copyWith(fontSize: fontSize, color: color, fontWeight: fontWeight),
    );
  }
}
