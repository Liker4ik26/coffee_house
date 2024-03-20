import 'package:coffee_house/src/pages/main/main_controller.dart';
import 'package:coffee_house/src/pages/main/widgets/category_tab.dart';
import 'package:coffee_house/src/shared/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryAppBar extends StatelessWidget {
  const CategoryAppBar({super.key, required this.controller});

  final MainController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.color.background,
      height: 36,
      child: ListView.separated(
        primary: false,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemBuilder: (context, index) {
          return Obx(
            () => CategoryTab(
              categoryIndex: index,
              selectedCategoryIndex: controller.currentIndex.value,
              category: controller.products.data[index].category,
              onTap: () {
                controller.currentIndex.value = index;
                controller.itemScrollController.scrollTo(
                  index: index,
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.decelerate,
                );
              },
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) => const SizedBox(
          width: 8,
        ),
        itemCount: controller.products.data.length,
      ),
    );
  }
}
