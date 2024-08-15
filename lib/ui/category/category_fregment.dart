import 'package:flutter/material.dart';
import 'package:news_app_project/core/model/category_model.dart';
import 'package:news_app_project/utils/color_resource/color_resources.dart';

import 'catrgory_item.dart';

class CategoryFragment extends StatelessWidget {
  CategoryFragment({super.key, required this.onClickCategoryItem});

  Function onClickCategoryItem;

  var categoryList = CategoryModel.getCategory();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "Pick your category \n of interest",
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: ColorResources.blackText),
          ),
          const SizedBox(
            height: 15,
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisSpacing: 15, crossAxisSpacing: 15),
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                    onTap: () {
                      onClickCategoryItem(categoryList[index]);
                    },
                    child: CategoryItem(
                      categoryModel: categoryList[index],
                      index: index,
                    ));
              },
              itemCount: categoryList.length,
            ),
          )
        ],
      ),
    );
  }
}
