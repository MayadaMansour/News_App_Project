import 'package:flutter/material.dart';
import 'package:news_app_project/core/model/SourcesNews.dart';
import 'package:news_app_project/core/network/api_manage.dart';
import 'package:news_app_project/utils/color_resource/color_resources.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  static const String routeName = "News_Screen";

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
          ),
          body: FutureBuilder<SourcesNewsModel?>(
            future: ApiManager.getSources(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(
                    color: ColorResources.primaryColor,
                  ),
                );
              } else if (snapshot.hasError) {
                return Column(
                  children: [
                    Text("Something went wrong"),
                    ElevatedButton(
                      onPressed: () {
                        // Trigger a retry
                      },
                      child: Text("Try Again"),
                    ),
                  ],
                );
              } else if (snapshot.data == null ||
                  snapshot.data!.status != "ok") {
                return Column(
                  children: [
                    Text(snapshot.data?.message ?? "Unknown error"),
                    ElevatedButton(
                      onPressed: () {
                        // Trigger a retry
                      },
                      child: Text("Try Again"),
                    ),
                  ],
                );
              }

              var sourcesList = snapshot.data!.sources;
              return ListView.builder(
                itemBuilder: (context, index) {
                  return Text(sourcesList[index].name!);
                },
                itemCount: sourcesList!.length,
              );
            },
          ),
        ),
      ],
    );
  }
}
