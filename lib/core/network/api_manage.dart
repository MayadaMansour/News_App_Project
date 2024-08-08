import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app_project/core/model/SourcesNews.dart';
import 'package:news_app_project/core/network/constants.dart';

class ApiManager {
  static Future<SourcesNewsModel?> getSources() async {
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.sources, {
      "apiKey": "7fee4affb2224ab8afe396526a9a24f5"
    });

    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        return SourcesNewsModel.fromJson(jsonDecode(response.body));
      } else {
        // Handle the case where the API response is not successful
        throw Exception('Failed to load sources');
      }
    } catch (e) {
      throw e;
    }
  }
}

