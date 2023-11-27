import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_menia/api/news_api.dart';
import 'package:news_menia/model/news_model.dart';

final apiSerivcesProvider = Provider<ApiModel>((ref) {
  return ApiModel();
});
final latestNewspro = FutureProvider((ref) async {
  return ref.read(apiSerivcesProvider).getapi();
});

final apisportsPro = FutureProvider((ref) async {
  return ref.read(apiSerivcesProvider).getsportsApi();
});

final apiHealthPro = FutureProvider((ref) async {
  return ref.read(apiSerivcesProvider).getHealthApi();
});

final apiPolitshPro = FutureProvider((ref) async {
  return ref.read(apiSerivcesProvider).getPoliticshApi();
});

final searchApiProvider =
    FutureProvider.family<NewsModel?, String>((ref, query) {
  return ref.watch(apiSerivcesProvider).serchApi(query);
});

// final searchProvider = FutureProvider((ref) async {
//   return ref.read(apiSerivcesProvider).;
// });

final texteditingProvider = Provider<TextEditingController>((ref) {
  return TextEditingController();
});
