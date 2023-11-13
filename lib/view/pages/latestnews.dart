// ignore_for_file: unnecessary_null_comparison

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_menia/extensions/responsive.size.dart';
import 'package:news_menia/provider/api_provider.dart';
import 'package:news_menia/view/home/news_details.dart';
import 'package:news_menia/widgets/loading_skeltons.dart';
import 'package:news_menia/widgets/text.dart';

class LatestNews extends ConsumerWidget {
  const LatestNews({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: ref.watch(latestNewspro).when(
            data: (data) {
              if (data == null) {
                const Center(
                  child: Text("Somthing Went Wrong"),
                );
              }
              return ListView.separated(
                shrinkWrap: true,
                itemCount: data!.articles.length,
                itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NewsInDeatail(
                            article: data.articles[index],
                          ),
                        ));
                  },
                  child: SizedBox(
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
                              child: CachedNetworkImage(
                                  fit: BoxFit.cover,
                                  errorWidget: (context, url, error) =>
                                      const Center(
                                        child:
                                            Icon(CupertinoIcons.xmark_circle),
                                      ),
                                  imageUrl: data.articles[index].url == null
                                      ? "https://resize.indiatvnews.com/en/centered/newbucket/1200_675/2022/09/breaking-news-template-3-1664499302.jpg"
                                      : data.articles[index].urlToImage
                                          .toString(),
                                  placeholder: (context, url) =>
                                      const LoadingImageSkelton()),
                            ),
                          ),
                          SizedBox(
                            height: context.width(8),
                          ),
                          SizedBox(
                            width: MediaQuery.sizeOf(context).width,
                            child: Text(
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,
                              data.articles[index].title == null
                                  ? "No Title"
                                  : data.articles[index].title!,
                              style: TextStyle(
                                fontSize: context.width(22),
                              ),
                            ),
                          ),
                          const Spacer(),
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
                ),
                separatorBuilder: (context, index) => SizedBox(
                  height: context.width(10),
                  child: Divider(
                    height: context.width(1),
                    color: Colors.pink,
                  ),
                ),
              );
            },
            error: (error, stackTrace) => Center(
              child: Styledtext(text: error.toString(), size: 18),
            ),
            loading: () => const LoadingSkelton(),
          ),
    );
  }
}
