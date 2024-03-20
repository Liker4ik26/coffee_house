import 'package:coffee_house/src/app/styles/dimensions.dart';
import 'package:coffee_house/src/shared/assets/assets.dart';
import 'package:coffee_house/src/shared/extensions/context_extensions.dart';
import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';

class ImageErrorWidget extends StatelessWidget {
  const ImageErrorWidget({super.key, this.bgColor});

  final Color? bgColor;

  @override
  Widget build(BuildContext context) {
    return ClipSmoothRect(
      radius: SmoothBorderRadius(
        cornerRadius: AppDimensions.small,
        cornerSmoothing: 1,
      ),
      child: Container(
        color: bgColor ?? context.color.background,
        child: Image.asset(
          Assets.imagesErrorImage,
          color: context.color.primary,
        ),
      ),
    );
  }
}
