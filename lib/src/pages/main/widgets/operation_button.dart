import 'package:coffee_house/src/shared/extensions/context_extensions.dart';
import 'package:coffee_house/src/shared/widgets/svg_icon.dart';
import 'package:flutter/material.dart';

class OperationButton extends StatelessWidget {
  const OperationButton(
      {super.key, required this.onPressed, required this.icon});

  final void Function() onPressed;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: CircleAvatar(
        radius: 12,
        backgroundColor: context.color.accent,
        child: SvgIcon(
          icon: icon,
          color: context.color.secondary,
        ),
      ),
    );
  }
}
