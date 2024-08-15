import 'package:flutter/material.dart';
import 'package:news_app_project/core/model/category_model.dart';
import 'package:news_app_project/ui/new_screen/tab_widget/tabs_widget.dart';

import '../../core/model/Search.dart'; // Import the Search model
import '../../core/model/SourcesNews.dart';
import '../../core/network/api_manage.dart';
import '../../utils/color_resource/color_resources.dart';

class CategoryDetails extends StatefulWidget {
  const CategoryDetails({super.key, required this.categoryModel});

  final CategoryModel categoryModel;

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourcesNewsModel?>(
      future: ApiManager.getSources(widget.categoryModel.id),
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
              const Text("Something went wrong"),
              ElevatedButton(
                onPressed: () {
                  setState(() {});
                },
                child: const Text("Try Again"),
              ),
            ],
          );
        } else if (snapshot.data == null || snapshot.data!.status != "ok") {
          return Column(
            children: [
              Text(snapshot.data?.message ?? "Unknown error"),
              ElevatedButton(
                onPressed: () {
                  setState(() {});
                },
                child: const Text("Try Again"),
              ),
            ],
          );
        }
        var sourcesList = snapshot.data!.sources!;

        Search search = Search(); // Instantiate Search object

        return TabsWidget(
          sourcesList: sourcesList,
          search: search, // Pass the Search object
        );
      },
    );
  }
}
