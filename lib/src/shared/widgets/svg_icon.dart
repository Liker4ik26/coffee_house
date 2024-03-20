import 'package:coffee_house/src/shared/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgIcon extends StatelessWidget {
  const SvgIcon({
    super.key,
    required this.icon,
    this.color,
    this.width,
    this.height,
  });

  final String icon;
  final Color? color;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      icon,
      colorFilter: ColorFilter.mode(
        color ?? context.color.primary,
        BlendMode.srcIn,
      ),
      width: width,
      height: height,
    );
  }
}
