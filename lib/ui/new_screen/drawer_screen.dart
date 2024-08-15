import 'package:flutter/material.dart';
import 'package:news_app_project/utils/color_resource/color_resources.dart';

class DrawerScreen extends StatelessWidget {
  DrawerScreen({super.key, required this.onSideMenuClick});

  static const int categories = 1;
  static const int setting = 2;

  final Function(int) onSideMenuClick;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height * 0.08,
          ),
          width: MediaQuery.of(context).size.width,
          color: ColorResources.primaryColor,
          child: Text(
            "News App",
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: ColorResources.white),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: InkWell(
            onTap: () {
              onSideMenuClick(categories);
            },
            child: const Row(
              children: [
                Icon(Icons.menu),
                SizedBox(width: 20),
                Text("Categories"),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: InkWell(
            onTap: () {
              onSideMenuClick(setting);
            },
            child: const Row(
              children: [
                Icon(Icons.settings),
                SizedBox(width: 20),
                Text("Setting"),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
