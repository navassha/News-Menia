// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_menia/extensions/responsive.size.dart';
import 'package:news_menia/provider/home_row.dart';
import 'package:news_menia/view/pages/health_news.dart';
import 'package:news_menia/view/pages/latest_news.dart';
import 'package:news_menia/view/pages/politics_news.dart';
import 'package:news_menia/view/pages/sports_news.dart';
import 'package:news_menia/widgets/home_row_container.dart';
import 'package:news_menia/widgets/text.dart';

class HomePage extends ConsumerWidget {
  HomePage({super.key});
  final paagecontroller = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageindex = ref.read(homeRowProvider);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: context.width(70),
        // automaticallyImplyLeading: false,
        iconTheme: CupertinoIconThemeData(
            color: Colors.white, size: context.width(26)),
        backgroundColor: Colors.pink[200],
        title: Padding(
          padding: EdgeInsets.only(left: context.width(10)),
          child: Row(
            children: [
              SizedBox(
                width: context.width(50),
                height: context.width(50),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(context.width(16)),
                  child: Image.asset(
                    "assets/images/Letter S Logo Symbol.jpeg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                width: context.width(20),
              ),
              const Styledtext(
                text: "News Menia",
                size: 22,
                fontWeight: FontWeight.w700,
              ),
              const Spacer(),
              Icon(
                CupertinoIcons.search,
                size: context.width(25),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(
          context.width(10),
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: const ClampingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(
                height: context.width(10),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                child: Row(
                  children: [
                    SizedBox(
                      width: context.width(10),
                    ),
                    HomeRowContainer(
                      pageController: paagecontroller,
                      number: 0,
                      text: "Latest",
                      borderRadius: 25,
                    ),
                    SizedBox(
                      width: context.width(13),
                    ),
                    HomeRowContainer(
                      pageController: paagecontroller,
                      number: 1,
                      text: "Sports",
                      borderRadius: 25,
                    ),
                    SizedBox(
                      width: context.width(13),
                    ),
                    HomeRowContainer(
                      pageController: paagecontroller,
                      number: 2,
                      text: "Health",
                      borderRadius: 25,
                    ),
                    SizedBox(
                      width: context.width(13),
                    ),
                    HomeRowContainer(
                      pageController: paagecontroller,
                      number: 3,
                      text: "Politics",
                      borderRadius: 25,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: context.width(10),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: context.width(700),
                // color: Colors.amber,
                child: PageView(
                  onPageChanged: (value) {
                    ref.read(homeRowProvider.notifier).state = value;
                    if (paagecontroller.hasClients) {
                      paagecontroller.animateToPage(
                        pageindex,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.linear,
                      );
                    }
                  },
                  children: const [
                    LatestNews(),
                    SportsNews(),
                    HealthNews(),
                    PoliticsNews(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      endDrawer: const Drawer(),
    );
  }
}
