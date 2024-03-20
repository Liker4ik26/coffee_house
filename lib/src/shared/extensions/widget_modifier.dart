import 'package:flutter/material.dart';

extension WidgetToSliver on Widget {
  Widget get sliver => SliverToBoxAdapter(child: this);
}