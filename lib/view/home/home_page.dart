import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_menia/widgets/text.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Styledtext(text: "Success Full", size: 22)),
    );
  }
}
