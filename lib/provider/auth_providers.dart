import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_menia/services/auth_serivces.dart';

final authstatechangeProvider = StreamProvider<User?>((ref) {
  return ref.read(authProvider).authstatechange();
});

final authProvider = Provider<AuthServices>((ref) {
  return AuthServices();
});
