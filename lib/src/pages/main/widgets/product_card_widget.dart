import 'package:coffee_house/src/app/styles/dimensions.dart';
import 'package:coffee_house/src/pages/main/widgets/operation_block.dart';
import 'package:coffee_house/src/shared/extensions/context_extensions.dart';
import 'package:coffee_house/src/shared/widgets/card_image.dart';
import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/products/product_model.dart';

class ProductCardWidget extends StatelessWidget {
  const ProductCardWidget({
    super.key,
    required this.onClickMinus,
    required this.onClickPlus,
    required this.quantity,
    required this.productModel,
    required this.addedToCart,
  });

  final ValueChanged<int> onClickMinus;
  final ValueChanged<int> onClickPlus;
  final VoidCallback addedToCart;
  final int quantity;
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: context.color.secondary,
          borderRadius: const SmoothBorderRadius.all(
              SmoothRadius(cornerRadius: 16, cornerSmoothing: 1))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CardImage(
            height: 100,
            width: MediaQuery.of(context).size.width / 4,
            borderRadius: const SmoothBorderRadius.all(SmoothRadius(
                cornerRadius: AppDimensions.small, cornerSmoothing: 1)),
            imageUrl: productModel.imageUrl,
          ),
          Text(
            productModel.name!,
            maxLines: 1,
            style: context.text.robotoMedium16,
            overflow: TextOverflow.ellipsis,
          ).paddingSymmetric(vertical: 8),

          quantity != 0
              ? OperationBlock(
                  onClickMinus: () => onClickMinus(productModel.id!),
                  onClickPlus: () => onClickPlus(productModel.id!),
                  quantity: quantity,
                )
              : SizedBox(
                  height: 24,
                  child: TextButton(
                    onPressed: addedToCart,
                    style: ButtonStyle(
                      padding: const MaterialStatePropertyAll(EdgeInsets.zero),
                      backgroundColor:
                          MaterialStatePropertyAll(context.color.accent),
                      shape: MaterialStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          productModel.prices!
                              .map((e) => formatPrice(e.value!, e.currency!))
                              .join(' '),
                          style: context.text.robotoRegular14.copyWith(
                            color: context.color.secondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
        ],
      ).paddingSymmetric(vertical: 14, horizontal: 32),
    );
  }
}

String formatPrice(String value, String currency) {
  if (currency == "RUB") {
    double priceValue = double.tryParse(value) ?? 0;
    return '${priceValue.toInt()} руб';
  }
  return '';
}
