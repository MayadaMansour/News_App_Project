import 'package:flutter/material.dart';

import '../../utils/color_resource/color_resources.dart';

class CategoryItem extends StatelessWidget {
  CategoryItem(
      {required this.txt,
      required this.img,
      required this.bgCard,
      super.key,
      required this.onClick});

  String txt;
  String img;
  Color bgCard;
  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              topRight: Radius.circular(40),
              topLeft: Radius.circular(40),
              bottomLeft: Radius.circular(40)),
          color: bgCard,
        ),
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Image.asset(
                img,
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                txt,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: ColorResources.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
