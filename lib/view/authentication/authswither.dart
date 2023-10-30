import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_menia/provider/auth_providers.dart';
import 'package:news_menia/view/getstarted/getstartedpage.dart';
import 'package:news_menia/view/home/home_page.dart';
import 'package:news_menia/widgets/text.dart';

class AuthSwitcher extends ConsumerWidget {
  const AuthSwitcher({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(authstatechangeProvider).when(
          data: (data) {
            if (data == null) {
              return const GetStartedPage();
            }
            return const HomePage();
          },
          error: (error, stackTrace) => const Center(
            child: Styledtext(text: "Somthing Went Wrong", size: 23),
          ),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
        );
  }
}
