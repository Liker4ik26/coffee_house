import 'package:coffee_house/src/shared/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

class TitleCategoryWidget extends StatelessWidget {
  const TitleCategoryWidget({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Text(
        title,
        style: context.text.robotoBold32,
      ),
    );
  }
}
