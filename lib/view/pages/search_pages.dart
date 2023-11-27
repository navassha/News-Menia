import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_menia/extensions/responsive.size.dart';
import 'package:news_menia/provider/api_provider.dart';
import 'package:news_menia/provider/fav_provider.dart';
import 'package:news_menia/view/home/news_details.dart';
import 'package:news_menia/widgets/favbotton.dart';
import 'package:news_menia/widgets/loading_skeltons.dart';
import 'package:news_menia/widgets/text.dart';

class SearchPage extends ConsumerWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fav = ref.watch(favBool);
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink[200],
          title: Row(
            children: [
              SizedBox(
                width: context.width(260),
                height: context.width(50),
                child: TextField(
                  style: TextStyle(
                      fontSize: context.width(18), color: Colors.white),
                  cursorColor: Colors.white,
                  cursorRadius: Radius.circular(context.width(10)),
                  cursorHeight: context.width(18),
                  controller: ref.watch(texteditingProvider),
                  decoration: InputDecoration(
                    hintText: "Search News",
                    contentPadding: EdgeInsets.all(
                      context.width(15),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 1, color: Colors.white),
                      borderRadius: BorderRadius.circular(
                        context.width(20),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 1, color: Colors.white),
                      borderRadius: BorderRadius.circular(
                        context.width(20),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: context.width(20),
              ),
              GestureDetector(
                onTap: () => ref.read(
                    searchApiProvider(ref.watch(texteditingProvider).text)),
                child: Container(
                  width: context.width(45),
                  height: context.width(45),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(
                      context.width(15),
                    ),
                  ),
                  child: const Center(
                    child: Icon(
                      CupertinoIcons.search,
                      color: Colors.black,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        body: ref.watch(texteditingProvider).text.isNotEmpty
            ? ref
                .read(searchApiProvider(ref.watch(texteditingProvider).text))
                .when(
                  data: (data) {
                    if (data == null) {
                      const Center(
                        child: Text("Search Movies"),
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
                            ),
                          );
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
                                              child: Icon(
                                                  CupertinoIcons.xmark_circle),
                                            ),
                                        // ignore: unnecessary_null_comparison
                                        imageUrl: data.articles[index].url ==
                                                null
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
                                      onPressed: () {
                                        favBottonWorking(ref, fav, data, index);
                                      },
                                      icon: data.articles[index].fav == false
                                          ? Icon(
                                              CupertinoIcons.heart,
                                              size: context.width(30),
                                            )
                                          : Icon(
                                              CupertinoIcons.heart_fill,
                                              size: context.width(30),
                                              color: Colors.pink,
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
                )
            : const Center(
                child: Styledtext(text: "Search News Here!", size: 18),
              ),
      ),
    );
  }
}
