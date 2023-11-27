import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:news_menia/model/news_model.dart';

class ApiModel {
  Dio dio = Dio(BaseOptions(
      baseUrl: "https://newsapi.org/v2",
      queryParameters: {"apiKey": "470d495df94d496db58afa0f5989fcb9"}));
  Future<NewsModel?> getapi() async {
    Response response =
        await dio.get("/everything", queryParameters: {"q": "new"});
    try {
      if (response.statusCode == 200) {
        String json = jsonEncode(response.data);
        return NewsModel.fromRawJson(json);
      }
      return null;
    } on DioException catch (e) {
      log(e.message.toString());
    }
    return null;
  }

  Future<NewsModel?> getsportsApi() async {
    Response response =
        await dio.get("/everything", queryParameters: {"q": "sports"});
    try {
      if (response.statusCode == 200) {
        String json = jsonEncode(response.data);
        return NewsModel.fromRawJson(json);
      }
      return null;
    } on DioException catch (e) {
      log(e.message.toString());
    }
    return null;
  }

  Future<NewsModel?> getHealthApi() async {
    Response response =
        await dio.get("/everything", queryParameters: {"q": "Health"});
    try {
      if (response.statusCode == 200) {
        String json = jsonEncode(response.data);
        return NewsModel.fromRawJson(json);
      }
      return null;
    } on DioException catch (e) {
      log(e.message.toString());
    }
    return null;
  }

  Future<NewsModel?> getPoliticshApi() async {
    Response response =
        await dio.get("/everything", queryParameters: {"q": "Politics"});
    try {
      if (response.statusCode == 200) {
        String json = jsonEncode(response.data);
        return NewsModel.fromRawJson(json);
      }
      return null;
    } on DioException catch (e) {
      log(e.message.toString());
    }
    return null;
  }

  Future<NewsModel?> serchApi(String qurey) async {
    Response response =
        await dio.get("/everything", queryParameters: {"q": qurey});
    try {
      if (response.statusCode == 200) {
        String json = jsonEncode(response.data);
        return NewsModel.fromRawJson(json);
      }
      return null;
    } on DioException catch (e) {
      log(e.message.toString());
    }
    return null;
  }
}
