import 'package:coffee_house/src/pages/main/widgets/operation_button.dart';
import 'package:coffee_house/src/shared/extensions/context_extensions.dart';
import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/export.dart';

import '../../../shared/assets/assets.dart';

class OperationBlock extends StatelessWidget {
  const OperationBlock({
    super.key,
    required this.onClickMinus,
    required this.onClickPlus,
    required this.quantity,
  });

  final GestureTapCallback onClickMinus;
  final GestureTapCallback onClickPlus;
  final int quantity;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        OperationButton(onPressed: onClickMinus, icon: Assets.iconsMinus),
        Container(
          constraints: const BoxConstraints(
            minHeight: 24,
          ),
          decoration: BoxDecoration(
            color: context.color.accent,
            borderRadius: const SmoothBorderRadius.all(
              SmoothRadius(cornerRadius: 16, cornerSmoothing: 1),
            ),
          ),
          child: Center(
            child: Text(
              quantity.toString(),
              style: context.text.robotoRegular12
                  .copyWith(color: context.color.secondary),
            ).paddingSymmetric(horizontal: 22),
          ),
        ),
        OperationButton(onPressed: onClickPlus, icon: Assets.iconsPlus),
      ],
    );
  }
}
