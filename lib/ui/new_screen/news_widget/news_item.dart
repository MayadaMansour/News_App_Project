import 'package:flutter/material.dart';
import 'package:news_app_project/core/model/NewsResponse.dart';

class NewsItem extends StatelessWidget {
   NewsItem({super.key,required this.news});

  News news;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network(news.url!),
        Text(news.title!),
        Text(news.description!),
      ],
    );
  }
}
