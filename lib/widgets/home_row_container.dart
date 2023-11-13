import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_menia/extensions/responsive.size.dart';
import 'package:news_menia/provider/home_row.dart';
import 'package:news_menia/widgets/text.dart';

class HomeRowContainer extends ConsumerWidget {
  const HomeRowContainer(
      {super.key,
      required this.pageController,
      required this.number,
      required this.text,
      required this.borderRadius});
  final int number;
  final double borderRadius;

  final String text;
  final PageController pageController;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      borderRadius: BorderRadius.circular(context.width(30)),
      onTap: () {
        pageController.jumpToPage(number);

        ref.read(homeRowProvider.notifier).state = number;
      },
      child: Container(
        // width: context.width(size),
        height: context.width(50),
        decoration: BoxDecoration(
          color: ref.watch(homeRowProvider) == number
              ? Colors.pink
              : Colors.pink[100],
          borderRadius: BorderRadius.circular(
            ref.watch(homeRowProvider) == number
                ? context.width(borderRadius)
                : context.width(10),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: context.width(25)),
          child: Center(
            child: Styledtext(
              text: text,
              size: 18,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
