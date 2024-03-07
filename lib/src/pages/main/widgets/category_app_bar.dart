import 'package:coffee_house/src/pages/main/main_controller.dart';
import 'package:coffee_house/src/shared/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/widget_extensions.dart';

class CategoryAppBar extends StatelessWidget {
  const CategoryAppBar({super.key, required this.controller});

  final MainController controller;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      floating: true,
      primary: true,
      snap: true,
      expandedHeight: 38,
      collapsedHeight: 38,
      toolbarHeight: 38,
      automaticallyImplyLeading: false,
      backgroundColor: context.color.background,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(20),
        child: Container(
          color: context.color.background,
          height: 38,
          child: TabBar(
            onTap: controller.changeTabIndex,
            isScrollable: true,
            tabs: controller.products.data
                .map((item) => Tab(text: item.category).paddingAll(8))
                .toList(),
          ),
        ),
      ),
    );
  }
}
