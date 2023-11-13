import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_menia/extensions/responsive.size.dart';
import 'package:news_menia/model/news_model.dart';
import 'package:news_menia/view/home/webview.dart';
import 'package:news_menia/widgets/text.dart';

class NewsInDeatail extends StatelessWidget {
  const NewsInDeatail({super.key, required this.article});

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[200],
        leading: IconButton(
          splashColor: Colors.transparent,
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            CupertinoIcons.back,
            size: context.width(30),
          ),
        ),
        title: Styledtext(
          text: "News in Details",
          size: context.width(25),
          fontWeight: FontWeight.w600,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              CupertinoIcons.search,
              size: context.width(26),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              CupertinoIcons.info,
              size: context.width(26),
            ),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(context.width(10)),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.sizeOf(context).width,
                height: context.width(400),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(context.width(10)),
                  child: CachedNetworkImage(
                    placeholder: (context, url) => Container(
                      height: context.width(400),
                      width: MediaQuery.sizeOf(context).width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          context.width(10),
                        ),
                      ),
                    ),
                    imageUrl: article.urlToImage != null
                        ? article.urlToImage.toString()
                        : "https://i.pinimg.com/564x/01/7c/44/017c44c97a38c1c4999681e28c39271d.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                height: context.width(10),
              ),
              Text(
                article.title != null
                    ? article.title.toString()
                    : "No Title Fonud",
                style: TextStyle(
                  fontFamily: 'mainfont',
                  fontSize: context.width(25),
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: context.width(5),
              ),
              Row(
                children: [
                  SizedBox(
                    width: context.width(210),
                    child: Text(
                      overflow: TextOverflow.ellipsis,
                      "auther :  ${article.author != null ? article.author.toString() : ""}",
                      style: TextStyle(
                        fontSize: context.width(18),
                        fontFamily: 'mainfont',
                      ),
                    ),
                  ),
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
                      CupertinoIcons.share,
                      size: context.width(25),
                    ),
                  )
                ],
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Styledtext(
                    text: "Source  : ${article.source.name}", size: 18),
              ),
              SizedBox(
                height: context.width(10),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Styledtext(
                    text:
                        "Published  : ${article.publishedAt.year}/${article.publishedAt.month}/${article.publishedAt.day}",
                    size: 18),
              ),
              SizedBox(
                height: context.width(10),
              ),
              const Styledtext(text: "Description", size: 25),
              SizedBox(
                height: context.width(10),
              ),
              Text(
                article.description,
                style: TextStyle(
                  fontFamily: "mainfont",
                  fontSize: context.width(19),
                ),
              ),
              Center(
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            WebViewContainer(link: article.url),
                      ),
                    );
                  },
                  child: Container(
                    width: context.width(170),
                    height: context.width(50),
                    decoration: BoxDecoration(
                      color: Colors.pink[200],
                      borderRadius: BorderRadius.circular(
                        context.width(20),
                      ),
                    ),
                    child: const Center(
                      child: Styledtext(
                        text: "Read Full News",
                        size: 17,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: context.width(50),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
