import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_menia/api/news_api.dart';

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
