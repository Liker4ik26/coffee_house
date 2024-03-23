import 'package:coffee_house/src/data/repo/products/repository.dart';
import 'package:coffee_house/src/shared/api/types.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../data/models/products/product_model.dart';

class MainController extends GetxController {
  late ScrollController scrollController = ScrollController();
  RxInt currentIndex = 0.obs;

  final List<GlobalKey> globalKeyList = [];

  final addedToCart = false.obs;

  late final RxMap<int, int> selectedProduct = <int, int>{}.obs;
  final productsRepo = Get.find<ProductsRepository>();
  final products = RxV(<ProductModel>[]);
  late final ItemPositionsListener itemPositionsListener;
  late final ItemScrollController itemScrollController;

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  Future<List<ProductModel>> getProducts() async {
    return productsRepo.getProducts(20, 0);
  }

  @override
  Future<void> onInit() async {
    load();
    itemPositionsListener = ItemPositionsListener.create();
    itemScrollController = ItemScrollController();
    final itemPositionsListenable = itemPositionsListener.itemPositions;
    itemPositionsListenable.addListener(() {
      currentIndex.value = itemPositionsListenable.value.first.index;
    });
  }

  Future<void> load() async {
    await Future.wait([getProducts()]);
  }
}
