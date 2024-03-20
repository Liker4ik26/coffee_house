import 'package:coffee_house/src/shared/extensions/context_extensions.dart';
import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/export.dart';

import '../../../app/styles/dimensions.dart';

class CategoryTab extends StatelessWidget {
  const CategoryTab({
    super.key,
    required this.categoryIndex,
    required this.category,
    required this.onTap,
    required this.selectedCategoryIndex,
  });

  final int categoryIndex;
  final int selectedCategoryIndex;
  final String category;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const SmoothBorderRadius.all(
        SmoothRadius(cornerRadius: AppDimensions.small, cornerSmoothing: 1),
      ),
      child: Material(
        color: categoryIndex == selectedCategoryIndex
            ? context.color.accent
            : context.color.secondary,
        child: InkWell(
          onTap: onTap,
          child: Align(
            alignment: Alignment.center,
            child: Text(
              category,
              style: context.text.robotoRegular14.copyWith(
                color: categoryIndex == selectedCategoryIndex
                    ? context.color.secondary
                    : context.color.primary,
              ),
            ).paddingAll(8),
          ),
        ),
      ),
    );
  }
}
