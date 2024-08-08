import 'package:flutter/material.dart';
import 'package:news_app_project/utils/color_resource/color_resources.dart';

import '../../../core/model/NewsResponse.dart';

class NewDetails extends StatelessWidget {
  News news;

  NewDetails({required this.news});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
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
            onPressed: (){
              Navigator.pop(context);
            }, icon: Icon(
            Icons.arrow_back_ios_sharp,
            color: ColorResources.white,
          ),

          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              news.urlToImage != null
                  ? Image.network(news.urlToImage!)
                  : Icon(Icons.broken_image, size: 100),
              SizedBox(height: 16),
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(news.author ?? 'Unknown Author',
                        maxLines: 3,
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(color: Colors.grey, fontSize: 16)),
                  ),
                  Spacer(),
                  Expanded(
                    child: Text(news.publishedAt ?? ' ',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Colors.grey,
                            fontSize: 16,
                            fontWeight: FontWeight.w600)),
                  ),
                ],
              ),
              Text(
                news.title ?? 'No Title',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontSize: 20,
                    color: ColorResources.blackText,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(height: 20),
              Text(
                news.description ?? 'No Content Available',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      )
    ]);
  }
}
