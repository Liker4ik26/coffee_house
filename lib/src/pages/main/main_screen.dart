import 'package:coffee_house/src/pages/main/main_controller.dart';
import 'package:coffee_house/src/pages/main/widgets/category_app_bar.dart';
import 'package:coffee_house/src/pages/main/widgets/product_grid.dart';
import 'package:coffee_house/src/shared/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreen extends GetView<MainController> {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          backgroundColor: context.color.background,
          bottom: PreferredSize(
              preferredSize: const Size.fromHeight(0),
              child: CategoryAppBar(
                controller: controller,
              )),
        ),
        body: RefreshIndicator(
          onRefresh: controller.load,
          color: context.color.primary,
          child: controller.products.data.isNotEmpty
              ? ProductGrid(controller: controller)
              : Center(
                  child: Text(context.tr.errorData),
                ),
        ),
      ),
    );
  }
}
