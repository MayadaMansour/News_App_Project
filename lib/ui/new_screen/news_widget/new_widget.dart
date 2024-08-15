import 'package:flutter/material.dart';
import 'package:news_app_project/core/model/NewsResponse.dart';
import 'package:news_app_project/core/model/Search.dart';
import 'package:news_app_project/core/model/SourcesNews.dart';

import '../../../core/network/api_manage.dart';
import '../../../utils/color_resource/color_resources.dart';
import 'new_details.dart';

class NewsWidget extends StatefulWidget {
  NewsWidget({super.key, required this.source, required this.search});

  final Source source;
  Search search;

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NewsResponse?>(
      future: ApiManager.getNewsBySourceId(
          widget.source.id ?? " ", widget.search.articles?.join(',') ?? ""),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(
              color: ColorResources.primaryColor,
            ),
          );
        } else if (snapshot.hasError) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Something went wrong"),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    ApiManager.getNewsBySourceId(widget.source.id ?? " ",
                        widget.search.articles?.join(',') ?? "");
                  });
                },
                child: const Text("Try Again"),
              ),
            ],
          );
        } else if (snapshot.data?.status != "ok") {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(snapshot.data?.message ?? "Unknown error"),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    ApiManager.getNewsBySourceId(widget.source.id ?? " ",
                        widget.search.articles?.join(',') ?? "");
                  });
                },
                child: const Text("Try Again"),
              ),
            ],
          );
        }

        var newsList = snapshot.data?.articles ?? [];

        if (newsList.isEmpty) {
          return const Center(child: Text("No news articles available."));
        }

        return ListView.builder(
          itemBuilder: (context, index) {
            final article = newsList[index];
            final imageUrl = article.urlToImage;

            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NewDetails(news: newsList[index]),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: imageUrl != null && imageUrl.isNotEmpty
                          ? Image.network(
                              imageUrl,
                              errorBuilder: (context, error, stackTrace) {
                                return const Icon(Icons.broken_image,
                                    size: 100);
                              },
                            )
                          : const Icon(Icons.broken_image, size: 100),
                    ),
                    Text(
                      article.title ?? 'No Title',
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(fontSize: 18),
                    ),
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(article.author ?? 'Unknown Author',
                              maxLines: 3,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(color: Colors.grey, fontSize: 16)),
                        ),
                        Spacer(),
                        Expanded(
                          child: Text(article.publishedAt ?? ' ',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(color: Colors.grey, fontSize: 16)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
          itemCount: newsList.length,
        );
      },
    );
  }
}
