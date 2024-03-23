import 'package:coffee_house/src/data/models/categories/category_model.dart';
import 'package:coffee_house/src/pages/main/widgets/category_tab.dart';
import 'package:coffee_house/src/shared/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class CategoryAppBar extends StatefulWidget {
  CategoryAppBar({
    Key? key,
    required this.categories,
    required this.currentIndex,
    required this.itemScrollController,
  }) : super(key: key);

  final List<CategoryModel> categories;
  late int currentIndex;
  late final ItemScrollController itemScrollController;

  @override
  _CategoryAppBarState createState() => _CategoryAppBarState();
}

class _CategoryAppBarState extends State<CategoryAppBar> {
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
          return CategoryTab(
            categoryIndex: index,
            selectedCategoryIndex: widget.currentIndex,
            category: widget.categories[index].slug!,
            onTap: () {
              setState(() {
                widget.currentIndex = index;
              });
              widget.itemScrollController.scrollTo(
                index: index,
                duration: const Duration(milliseconds: 400),
                curve: Curves.decelerate,
              );
            },
          );
        },
        separatorBuilder: (BuildContext context, int index) => const SizedBox(
          width: 8,
        ),
        itemCount: widget.categories.length,
      ),
    );
  }
}