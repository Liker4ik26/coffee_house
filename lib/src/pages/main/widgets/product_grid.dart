import 'package:coffee_house/src/pages/main/main_controller.dart';
import 'package:coffee_house/src/pages/main/widgets/product_card_widget.dart';
import 'package:coffee_house/src/pages/main/widgets/title_category_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_utils/src/extensions/export.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class ProductGrid extends StatelessWidget {
  const ProductGrid({super.key, required this.controller});

  final MainController controller;

  @override
  Widget build(BuildContext context) {
    return ScrollablePositionedList.builder(
      itemCount: controller.products.data.length,
      itemPositionsListener: controller.itemPositionsListener,
      itemScrollController: controller.itemScrollController,
      padding: const EdgeInsets.all(16),
      itemBuilder: (context, section) {
        final categoryIndex = controller.products.data[section];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitleCategoryWidget(
              title: categoryIndex.category,
            ).paddingSymmetric(vertical: 16),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16.0,
                crossAxisSpacing: 16.0,
                childAspectRatio:
                    (MediaQuery.of(context).size.width - 24) / 2 / 220,
              ),
              itemCount: controller.products.data[section].productsList.length,
              itemBuilder: (context, index) {
                final product =
                    controller.products.data[section].productsList[index];
                return Obx(
                  () => ProductCardWidget(
                    onClickMinus: (id) {
                      controller.selectedProduct.update(
                        product.id,
                        (value) => value - 1,
                      );
                    },
                    onClickPlus: (id) {
                      if (controller.selectedProduct[id]! <= 9) {
                        controller.selectedProduct.update(
                          id,
                          (value) => value + 1,
                        );
                      }
                    },
                    quantity: controller.selectedProduct[product.id],
                    productModel: product,
                    addedToCart: () {
                      controller.selectedProduct.update(
                        product.id,
                        (value) => value + 1,
                        ifAbsent: () => 1,
                      );
                    },
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
