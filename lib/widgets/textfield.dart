import 'package:flutter/material.dart';
import 'package:news_menia/extensions/responsive.size.dart';
import 'package:news_menia/widgets/text.dart';

class TextfieldForDataGetting extends StatelessWidget {
  const TextfieldForDataGetting(
      {super.key,
      required this.controller,
      this.obscureText = false,
      this.iconButton,
      required this.label,
      required this.icon});

  final TextEditingController controller;
  final Icon icon;
  final String label;
  final IconButton? iconButton;
  final bool obscureText;
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      controller: controller,
      style: TextStyle(
          fontSize: context.width(16),
          color: Colors.white,
          fontFamily: 'mainfont'),
      cursorColor: Colors.white,
      cursorHeight: context.width(25),
      autocorrect: true,
      decoration: InputDecoration(
        suffixIcon: iconButton,
        prefixIcon: icon,
        label: Styledtext(
          text: label,
          size: 16,
          color: Colors.white,
        ),
        hintStyle: TextStyle(fontSize: context.width(16), color: Colors.white),
        contentPadding: EdgeInsets.all(
          context.width(18),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white, width: 1.5),
          borderRadius: BorderRadius.circular(
            context.width(25),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white, width: 1.5),
          borderRadius: BorderRadius.circular(
            context.width(25),
          ),
        ),
      ),
    );
  }
}
