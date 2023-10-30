import 'package:flutter/material.dart';
import 'package:news_menia/extensions/responsive.size.dart';

class Styledtext extends StatelessWidget {
  const Styledtext(
      {super.key,
      required this.text,
      required this.size,
      this.color,
      this.fontWeight});
  final String text;
  final double size;
  final FontWeight? fontWeight;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: context.width(size),
        fontWeight: fontWeight,
        fontFamily: 'mainfont',
        color: color,
      ),
    );
  }
}
