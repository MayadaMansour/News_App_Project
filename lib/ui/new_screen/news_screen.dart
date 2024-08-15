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
  CategoryModel? selectCategory;
  int selectItemMenu = DrawerScreen.categories;

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
            title: Text(
              selectItemMenu == DrawerScreen.setting
                  ? "Setting"
                  : selectCategory == null
                      ? "News App"
                      : selectCategory!.title,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          body: selectItemMenu == DrawerScreen.setting
              ? const SettingScreen()
              : selectCategory == null
                  ? CategoryFragment(
                      onClickCategoryItem: onCategoryItemClick,
                    )
                  : CategoryDetails(
                      categoryModel: selectCategory!,
                    ),
        ),
      ],
    );
  }

  void onCategoryItemClick(CategoryModel newCategory) {
    setState(() {
      selectCategory = newCategory;
    });

    if (selectCategory != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CategoryDetails(
            categoryModel: selectCategory!,
          ),
        ),
      );
    }
  }

  void onSideMenuItem(int newSideMenu) {
    setState(() {
      selectItemMenu = newSideMenu;
      selectCategory = null;
    });

    Navigator.pop(context);
  }
}
