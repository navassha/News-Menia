import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_menia/firebase_options.dart';

import 'package:news_menia/view/home/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform, name: "news-app-6c122");

  runApp(
    const ProviderScope(
      child: NewsMenia(),
    ),
  );
}

class NewsMenia extends StatelessWidget {
  const NewsMenia({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
