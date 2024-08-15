import 'package:flutter/material.dart';
import 'package:news_app_project/utils/color_resource/color_resources.dart';

import '../../../core/model/NewsResponse.dart';
import '../../web_view/web.dart';

class NewDetails extends StatelessWidget {
  final News news;

  NewDetails({required this.news});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: ColorResources.white,
          child: Image.asset(
            "assets/images/pattern.png",
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              "News App",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios_sharp,
                color: ColorResources.white,
              ),
            ),
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: news.urlToImage != null
                      ? Image.network(news.urlToImage!)
                      : const Icon(Icons.broken_image, size: 100),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: Text(news.author ?? 'Unknown Author',
                          maxLines: 3,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(color: Colors.grey, fontSize: 16)),
                    ),
                    const Spacer(),
                    Expanded(
                      child: Text(news.publishedAt ?? ' ',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(
                                  color: Colors.grey,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600)),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  news.title ?? 'No Title',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontSize: 20,
                      color: ColorResources.blackText,
                      fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 20),
                Text(
                  news.content ?? 'No Content Available',
                  style: const TextStyle(fontSize: 16),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                Align(
                  alignment: Alignment.bottomRight,
                  child: IconButton(
                    onPressed: news.url != null
                        ? () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => WebViewExample(
                                  url: news.url!,
                                  title: news.source!.name ?? "No Title",
                                ),
                              ),
                            );
                          }
                        : null,
                    icon: Icon(Icons.arrow_forward_ios_rounded),
                    color: news.url != null ? Colors.blue : Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
