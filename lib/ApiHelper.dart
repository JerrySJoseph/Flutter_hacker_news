import 'dart:convert';

import 'package:hacker_news/Models/ModelLibrary.dart';
import 'package:http/http.dart' as http;

class ApiHelper {
  static String URL_TOPSTORIESID =
      "https://hacker-news.firebaseio.com/v0/topstories.json";
  static String URL_ASKSTORIESID =
      "https://hacker-news.firebaseio.com/v0/askstories.json";
  static String getApiURL(int id) {
    return "https://hacker-news.firebaseio.com/v0/item/$id.json";
  }

  static Future<List<int>> fetchTopStoriesIds() async {
    final response = await http.get(URL_TOPSTORIESID);
    var parsed = jsonDecode(response.body);
    return List<int>.from(parsed);
  }

  static Future<List<int>> fetchAskStoriesIds() async {
    final response = await http.get(URL_ASKSTORIESID);
    var parsed = jsonDecode(response.body);
    return List<int>.from(parsed);
  }

  static Future<Article> fetchArticle(int id) async {
    final response = await http.get(getApiURL(id));
    var parsed = jsonDecode(response.body);
    return Article.fromJson(parsed);
  }

  static Future<List<Article>> fetchAllArticle(int limit) async {
    List<Article> models = new List();
    List<int> ids = await fetchTopStoriesIds();
    if (limit > ids.length) limit = ids.length;
    for (int i = 0; i < limit; i++) {
      Article model = await fetchArticle(ids[i]);
      models.add(model);
    }
    return await models;
  }
}
