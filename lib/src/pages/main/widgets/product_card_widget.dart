import 'package:coffee_house/src/pages/main/widgets/operation_block.dart';
import 'package:coffee_house/src/repo/products/model.dart';
import 'package:coffee_house/src/shared/extensions/context_extensions.dart';
import 'package:coffee_house/src/shared/widgets/card_image.dart';
import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductCardWidget extends StatelessWidget {
  const ProductCardWidget({
    super.key,
    required this.onClickMinus,
    required this.onClickPlus,
    required this.quantity,
    required this.productModel,
    required this.addedToCart,
  });

  final ValueChanged<String> onClickMinus;
  final ValueChanged<String> onClickPlus;
  final VoidCallback addedToCart;
  final int? quantity;
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
            borderRadius: const SmoothBorderRadius.all(
                SmoothRadius(cornerRadius: 16, cornerSmoothing: 1)),
            imageUrl: productModel.image,
          ),
          Text(
            productModel.name,
            maxLines: 1,
            style: context.text.robotoMedium16,
            overflow: TextOverflow.ellipsis,
          ).paddingSymmetric(vertical: 8),
          quantity != null && quantity! != 0
              ? OperationBlock(
                  onClickMinus: () => onClickMinus(productModel.id),
                  onClickPlus: () => onClickPlus(productModel.id),
                  quantity: quantity!,
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
                          '${productModel.cost.toInt()} ${context.tr.currency}',
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
