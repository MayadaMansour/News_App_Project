import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app_project/core/model/NewsResponse.dart';
import 'package:news_app_project/core/model/SourcesNews.dart';
import 'package:news_app_project/core/network/constants.dart';

class ApiManager {
  static Future<SourcesNewsModel?> getSources(String categoryId) async {
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.sources,
        {"apiKey": "7fee4affb2224ab8afe396526a9a24f5", "category": categoryId});

    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        return SourcesNewsModel.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to load sources');
      }
    } catch (e) {
      throw e;
    }
  }

  static Future<NewsResponse?> getNewsBySourceId(
      String sourceId, String value) async {
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.articals, {
      "apiKey": "7fee4affb2224ab8afe396526a9a24f5",
      "sources": sourceId,
      'q': '$value',
    });

    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        return NewsResponse.fromJson(
            jsonDecode(response.body)); // Return the NewsResponse object
      } else {
        throw Exception('Failed to load news');
      }
    } catch (e) {
      throw e;
    }
  }
}
