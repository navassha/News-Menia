import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_menia/extensions/responsive.size.dart';

class PoliticsNews extends StatelessWidget {
  const PoliticsNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        itemCount: 2,
        itemBuilder: (context, index) => SizedBox(
          width: MediaQuery.sizeOf(context).width,
          height: context.width(400),
          child: Padding(
            padding: EdgeInsets.all(context.width(10)),
            child: Column(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: context.width(240),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(
                      context.width(10),
                    ),
                    child: Image.network(
                      "https://resize.indiatvnews.com/en/centered/newbucket/1200_675/2022/09/breaking-news-template-3-1664499302.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  height: context.width(5),
                ),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width,
                  child: Text(
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                    "ksdksd skjfksfjndknfekf deidj dijiedf efoenfeefeofn fjioenf efjie sndk sfnk  denfkfjenf feifnka dd qdnj sfkn     ksnd  n",
                    style: TextStyle(fontSize: context.width(22)),
                  ),
                ),
                Row(
                  children: [
                    const Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        CupertinoIcons.heart,
                        size: context.width(30),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        CupertinoIcons.bookmark,
                        size: context.width(28),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        CupertinoIcons.share,
                        size: context.width(28),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        separatorBuilder: (context, index) => SizedBox(
          height: context.width(10),
          child: Divider(
            height: context.width(1),
            color: Colors.pink,
          ),
        ),
      ),
    );
  }
}
