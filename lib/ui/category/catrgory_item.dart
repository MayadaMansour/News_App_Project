import 'package:flutter/material.dart';

import '../../core/model/category_model.dart';
import '../../utils/color_resource/color_resources.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    // required this.onClick,
    required this.categoryModel,
    required this.index,
  });

  // final VoidCallback onClick;
  final CategoryModel categoryModel;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: const Radius.circular(25),
          topLeft: const Radius.circular(25),
          bottomLeft: Radius.circular(index % 2 == 0 ? 40 : 0),
          bottomRight: Radius.circular(index % 2 != 0 ? 40 : 0),
        ),
        color: categoryModel.color,
      ),
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: Image.asset(
              categoryModel.imgPath,
              fit: BoxFit.contain,
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              categoryModel.title,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: ColorResources.white),
            ),
          ),
        ],
      ),
    );
  }
}
