import 'package:flutter/cupertino.dart';
import 'package:news_menia/extensions/responsive.size.dart';

class LoadingSkelton extends StatelessWidget {
  const LoadingSkelton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) => SizedBox(
              width: MediaQuery.of(context).size.width,
              height: context.width(400),
              child: Padding(
                padding: EdgeInsets.all(
                  context.width(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const LoadingImageSkelton(),
                    SizedBox(
                      height: context.width(10),
                    ),
                    Container(
                      width: MediaQuery.sizeOf(context).width,
                      height: context.width(30),
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 234, 234, 234),
                          borderRadius:
                              BorderRadius.circular(context.width(10))),
                    ),
                    SizedBox(
                      height: context.width(5),
                    ),
                    Container(
                      width: MediaQuery.sizeOf(context).width,
                      height: context.width(30),
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 234, 234, 234),
                          borderRadius:
                              BorderRadius.circular(context.width(10))),
                    ),
                    SizedBox(
                      height: context.width(5),
                    ),
                    Container(
                      width: context.width(270),
                      height: context.width(30),
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 234, 234, 234),
                          borderRadius:
                              BorderRadius.circular(context.width(10))),
                    )
                  ],
                ),
              ),
            ),
        separatorBuilder: (context, index) => SizedBox(
              height: context.width(5),
            ),
        itemCount: 5);
  }
}

class LoadingImageSkelton extends StatelessWidget {
  const LoadingImageSkelton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: context.width(240),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 234, 234, 234),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
