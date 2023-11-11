import 'dart:ui';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_menia/extensions/responsive.size.dart';
import 'package:news_menia/provider/auth_providers.dart';

import 'package:news_menia/provider/show_password.dart';

import 'package:news_menia/view/getstarted/getstartedpage.dart';
import 'package:news_menia/widgets/backButton.dart';
import 'package:news_menia/widgets/text.dart';
import 'package:news_menia/widgets/textfield.dart';

class SignUpScreen extends ConsumerWidget {
  SignUpScreen({super.key});

  final name = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final showpassword = ref.watch(signupshowpassword);
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Container(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                "assets/images/_Italian Ruscus Leaves On White_ by Stocksy Contributor _Kristin Duvall_.jpeg",
              ),
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
                    height: context.width(440),
                    color: const Color(0x53080808),
                    child: Padding(
                      padding: EdgeInsets.all(context.width(15)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Styledtext(
                            text: "SignUp Here!",
                            size: 31,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                          SizedBox(
                            height: context.width(5),
                          ),
                          const Styledtext(
                            text:
                                "Please enter your valid data in order to the colums to  create a account",
                            size: 18,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFFFFFFFF),
                          ),
                          SizedBox(
                            height: context.width(20),
                          ),
                          TextfieldForDataGetting(
                            controller: name,
                            label: 'Enter Your Name',
                            icon: Icon(
                              CupertinoIcons.textformat_alt,
                              size: context.width(22),
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            height: context.width(20),
                          ),
                          TextfieldForDataGetting(
                            controller: email,
                            label: 'Enter Your Email Address',
                            icon: Icon(
                              CupertinoIcons.mail,
                              size: context.width(22),
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            height: context.width(20),
                          ),
                          TextfieldForDataGetting(
                            obscureText: showpassword == true ? false : true,
                            iconButton: IconButton(
                              onPressed: () {
                                ref.read(signupshowpassword.notifier).state =
                                    !showpassword;
                              },
                              icon: showpassword == false
                                  ? Icon(
                                      CupertinoIcons.eye_slash,
                                      size: context.width(22),
                                      color: Colors.white,
                                    )
                                  : Icon(
                                      CupertinoIcons.eye,
                                      size: context.width(22),
                                      color: Colors.white,
                                    ),
                            ),
                            controller: password,
                            label: 'Enter Your Password',
                            icon: Icon(
                              CupertinoIcons.lock,
                              size: context.width(22),
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            height: context.width(20),
                          ),
                          Row(
                            children: [
                              ModiFiedBackButton(),
                              SizedBox(
                                width: context.width(60),
                              ),
                              Center(
                                child: InkWell(
                                  onTap: () async {
                                    if (name.text.isEmpty &&
                                        email.text.isEmpty &&
                                        password.text.isEmpty) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          backgroundColor: Colors.white,
                                          content: Styledtext(
                                            text: "Fill the Madotory Columns",
                                            size: 18,
                                          ),
                                        ),
                                      );
                                    } else {
                                      try {
                                        ref.read(authProvider).createUser(
                                            email.text, password.text);
                                      } on FirebaseException catch (e) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            backgroundColor: Colors.white,
                                            content: Styledtext(
                                              text: "$e",
                                              size: 18,
                                            ),
                                          ),
                                        );
                                      }
                                    }
                                  },
                                  child: const ClickContainer(
                                    containercolor:
                                        Color.fromARGB(255, 15, 34, 49),
                                    text: "Sign Up",
                                    bordercolor: Colors.transparent,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: context.width(20),
              )
            ],
          ),
        ),
      ),
    );
  }
}
