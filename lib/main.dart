import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_menia/firebase_options.dart';
import 'package:news_menia/view/authentication/authswither.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
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
    return const MaterialApp(
      home: AuthSwitcher(),
      debugShowCheckedModeBanner: false,
    );
  }
}
