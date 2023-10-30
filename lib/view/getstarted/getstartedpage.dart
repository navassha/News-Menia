import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:news_menia/extensions/responsive.size.dart';
import 'package:news_menia/view/authentication/login_page.dart';
import 'package:news_menia/view/authentication/signup_page.dart';
import 'package:news_menia/widgets/text.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/_.jpeg"),
            filterQuality: FilterQuality.high,
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            const Spacer(),
            ClipRRect(
              borderRadius: BorderRadius.circular(context.width(20)),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                child: Container(
                  width: context.width(390),
                  height: context.width(340),
                  color: const Color(0x39737373),
                  child: Padding(
                    padding: EdgeInsets.all(context.width(15)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Styledtext(
                          text: "Every News In Your\nHands",
                          size: 27,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                        SizedBox(
                          height: context.width(5),
                        ),
                        const Styledtext(
                          size: 18,
                          text:
                              "Read News for free and keep Updated Every Time",
                          color: Colors.white,
                        ),
                        SizedBox(
                          height: context.width(15),
                        ),
                        const Styledtext(
                          color: Colors.white,
                          text:
                              "If You Alreay Have A Account Click Login , \nIf You Don't Have Account Don't Worry Click SignUp",
                          size: 18,
                        ),
                        const Spacer(),
                        _loginORsignupROW(context)
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: context.width(30),
            )
          ],
        ),
      ),
    );
  }

  Row _loginORsignupROW(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => LoginScreen(),
              ),
            );
          },
          borderRadius: BorderRadius.circular(20),
          child: const ClickContainer(
            text: 'Login',
            containercolor: Colors.transparent,
            bordercolor: Colors.white,
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SignUpScreen(),
              ),
            );
          },
          child: const ClickContainer(
            bordercolor: Colors.transparent,
            text: "Sign Up",
            containercolor: Color.fromARGB(255, 6, 22, 35),
          ),
        )
      ],
    );
  }
}

class ClickContainer extends StatelessWidget {
  const ClickContainer(
      {super.key, required this.text, this.bordercolor, this.containercolor});
  final Color? bordercolor;
  final String text;
  final Color? containercolor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width(160),
      height: context.width(50),
      decoration: BoxDecoration(
        color: containercolor,
        border: Border.all(width: 1.5, color: bordercolor!),
        borderRadius: BorderRadius.circular(
          context.width(20),
        ),
      ),
      child: Center(
        child: Styledtext(
          text: text,
          size: 18,
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
