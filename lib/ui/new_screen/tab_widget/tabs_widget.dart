import 'package:flutter/material.dart';
import 'package:news_app_project/ui/new_screen/tab_widget/tab_item.dart';

import '../../../core/model/SourcesNews.dart';
import '../news_widget/new_widget.dart';

class TabsWidget extends StatefulWidget {
  TabsWidget({super.key, required this.sourcesList});

  List<Source> sourcesList;

  @override
  State<TabsWidget> createState() => _TabsWidgetState();
}

class _TabsWidgetState extends State<TabsWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: widget.sourcesList.length,
        child: Column(
          children: [
            TabBar(
                onTap: (index) {
                  selectedIndex = index;
                  setState(() {});
                },
                isScrollable: true,
                indicatorColor: Colors.transparent,
                tabs: widget.sourcesList
                    .map((sources) => TabItem(
                        isSelected: selectedIndex ==
                            widget.sourcesList.indexOf(sources),
                        sources: sources))
                    .toList()),
            Expanded(
                child: NewsWidget(source: widget.sourcesList[selectedIndex]))
          ],
        ));
  }
}
