import 'package:coffee_house/src/pages/main/main_controller.dart';
import 'package:coffee_house/src/pages/main/widgets/category_app_bar.dart';
import 'package:coffee_house/src/pages/main/widgets/product_grid.dart';
import 'package:coffee_house/src/shared/extensions/context_extensions.dart';
import 'package:coffee_house/src/shared/extensions/widget_modifier.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreen extends GetView<MainController> {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ever(controller.currentIndex, (_) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        final RenderObject? category;
        category = controller
            .globalKeyList[controller.currentIndex.value].currentContext
            ?.findRenderObject();
        if (category != null) {
          controller.scrollController.position.ensureVisible(category,
              duration: const Duration(milliseconds: 500));
        }
      });
    });

    return Obx(
      () => DefaultTabController(
        length: controller.products.data.length,
        child: Scaffold(
          body: RefreshIndicator(
            onRefresh: controller.load,
            color: context.color.primary,
            child: controller.products.data.isNotEmpty
                ? CustomScrollView(
                    controller: controller.scrollController,
                    primary: false,
                    slivers: [
                      CategoryAppBar(controller: controller),
                      ProductGrid(controller: controller),
                      SliverSafeArea(
                        top: false,
                        sliver: const SizedBox(height: 24).sliver,
                      ),
                    ],
                  )
                : Center(
                    child: Text(context.tr.errorData),
                  ),
          ),
        ),
      ),
    );
  }
}
