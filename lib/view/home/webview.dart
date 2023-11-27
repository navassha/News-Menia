import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_menia/extensions/responsive.size.dart';
import 'package:news_menia/widgets/text.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewContainer extends StatelessWidget {
  const WebViewContainer({super.key, required this.link});
  final String link;

  @override
  Widget build(BuildContext context) {
    final controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(link));

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            CupertinoIcons.back,
            size: context.width(30),
          ),
        ),
        backgroundColor: Colors.pink[200],
        title: const Styledtext(
          text: "WebView",
          size: 25,
          fontWeight: FontWeight.w600,
        ),
      ),
      body: WebViewWidget(controller: controller),
    );
  }
}
