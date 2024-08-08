import 'package:flutter/material.dart';

import '../../utils/color_resource/color_resources.dart';
import '../board/catrgory_item.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

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
          body: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text("Pick your category\n of interest"),
                const SizedBox(
                  height: 25,
                ),
                Expanded(
                  child: GridView.count(
                    primary: false,
                    padding: const EdgeInsets.all(4),
                    crossAxisSpacing: 25,
                    mainAxisSpacing: 25,
                    crossAxisCount: 2,
                    children: [
                      CategoryItem(
                        txt: 'Sport',
                        img: 'assets/images/ball.png',
                        bgCard: ColorResources.sportsCard,
                        onClick: () {},
                      ),
                      CategoryItem(
                        txt: 'Politics',
                        img: 'assets/images/Politics.png',
                        bgCard: ColorResources.politicsCard,
                        onClick: () {},
                      ),
                      CategoryItem(
                        txt: 'Health',
                        img: 'assets/images/health.png',
                        bgCard: ColorResources.healthsCard,
                        onClick: () {},
                      ),
                      CategoryItem(
                        txt: 'Business',
                        img: 'assets/images/bussines.png',
                        bgCard: ColorResources.businessCard,
                        onClick: () {},
                      ),
                      CategoryItem(
                        txt: 'Enviroment',
                        img: 'assets/images/environment.png',
                        bgCard: ColorResources.enviromentCard,
                        onClick: () {},
                      ),
                      CategoryItem(
                        txt: 'Science',
                        img: 'assets/images/science.png',
                        bgCard: ColorResources.scienceCard,
                        onClick: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
