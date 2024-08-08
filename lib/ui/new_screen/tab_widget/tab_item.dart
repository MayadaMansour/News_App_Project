import 'package:flutter/material.dart';
import 'package:news_app_project/core/model/SourcesNews.dart';
import 'package:news_app_project/utils/color_resource/color_resources.dart';

class TabItem extends StatelessWidget {
  TabItem({super.key, required this.isSelected, required this.sources});

  bool isSelected;
  Source sources;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
       padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(width: 2, color: ColorResources.primaryColor),
          color: isSelected ? ColorResources.primaryColor : Colors.transparent),
      child: Text(
        sources.name ?? " ",
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: isSelected
                ? ColorResources.white
                : ColorResources.primaryColor),
      ),
    );
  }
}
