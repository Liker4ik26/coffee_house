import 'package:coffee_house/src/pages/main/main_controller.dart';
import 'package:coffee_house/src/pages/main/widgets/product_card_widget.dart';
import 'package:coffee_house/src/pages/main/widgets/title_category_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_utils/src/extensions/export.dart';

class ProductGrid extends StatelessWidget {
  const ProductGrid({super.key, required this.controller});

  final MainController controller;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, section) {
          final categoryIndex = controller.products.data[section];
          return Column(
            key: controller.globalKeyList[section],
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TitleCategoryWidget(
                title: categoryIndex.category,
              ).paddingSymmetric(horizontal: 16),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16.0,
                  crossAxisSpacing: 16.0,
                  childAspectRatio:
                      (MediaQuery.of(context).size.width - 24) / 2 / 210,
                ),
                itemCount:
                    controller.products.data[section].productsList.length,
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
              ).paddingSymmetric(horizontal: 16),
            ],
          );
        },
        childCount: controller.products.data.length,
      ),
    );
  }
}
