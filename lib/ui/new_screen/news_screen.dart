import 'package:animated_search_bar/animated_search_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app_project/core/model/category_model.dart';
import 'package:news_app_project/ui/category/category_details.dart';
import 'package:news_app_project/ui/category/category_fregment.dart';
import 'package:news_app_project/ui/new_screen/drawer_screen.dart';
import 'package:news_app_project/utils/color_resource/color_resources.dart';

import '../setting/setting_screen.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  static const String routeName = "News_Screen";

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  CategoryModel? selectedCategory;
  int selectedItemMenu = DrawerScreen.categories;
  String searchText = '';
  final TextEditingController _controller = TextEditingController(text: '');
  bool showSearchResults = false;

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
          drawer: Drawer(
            backgroundColor: ColorResources.white,
            width: MediaQuery.of(context).size.width * 0.6,
            child: DrawerScreen(
              onSideMenuClick: onSideMenuItem,
            ),
          ),
          appBar: AppBar(
            centerTitle: true,
            title: AnimatedSearchBar(
              labelAlignment: Alignment.center,
              closeIcon: IconButton(
                onPressed: () {
                  _controller.clear();
                  showSearchResults = false;
                  setState(() {});
                },
                icon: const Icon(Icons.clear),
              ),
              label: selectedItemMenu == DrawerScreen.setting
                  ? "Setting"
                  : selectedCategory == null
                      ? "News App"
                      : selectedCategory!.title,
              controller: _controller,
              searchIcon: Icon(
                color: ColorResources.white,
                CupertinoIcons.search,
                size: 25,
              ),
              labelStyle: const TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
              searchStyle: const TextStyle(color: Colors.black38),
              labelTextAlign: TextAlign.start,
              cursorColor: Colors.white,
              height: 40,
              textInputAction: TextInputAction.done,
              searchDecoration: const InputDecoration(
                filled: true,
                hintText: '  Search...',
                alignLabelWithHint: true,
                fillColor: Colors.white,
                hintStyle: TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(45)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 1.0, color: Colors.grey),
                  borderRadius: BorderRadius.all(Radius.circular(45)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(45)),
                  borderSide: BorderSide(width: 1.0, color: Colors.grey),
                ),
              ),
              onChanged: (value) {
                searchText = value.toUpperCase();
                // ApiManager.getNewsBySourceId(widget.source.id ?? " ",
                //     widget.search.articles?.join(',') ?? "");
                showSearchResults = true;
                setState(() {});
              },
              onClose: () {
                _controller.clear();
                showSearchResults = false;
                setState(() {});
              },
              onFieldSubmitted: (value) {
                searchText = value;
                setState(() {});
              },
            ),
          ),
          body: selectedItemMenu == DrawerScreen.setting
              ? const SettingScreen()
              : selectedCategory == null
                  ? CategoryFragment(
                      onClickCategoryItem: onCategoryItemClick,
                    )
                  : CategoryDetails(
                      categoryModel: selectedCategory!,
                    ),
        ),
      ],
    );
  }

  void onCategoryItemClick(CategoryModel newCategory) {
    setState(() {
      selectedCategory = newCategory;
      selectedItemMenu = DrawerScreen.categories;
    });
  }

  void onSideMenuItem(int newSideMenu) {
    setState(() {
      selectedItemMenu = newSideMenu;
      selectedCategory = null;
    });

    Navigator.pop(context); // Close the drawer
  }
}
