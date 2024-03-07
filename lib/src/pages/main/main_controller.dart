import 'package:coffee_house/src/repo/products/model.dart';
import 'package:coffee_house/src/repo/products/repository.dart';
import 'package:coffee_house/src/shared/api/types.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  late ScrollController scrollController = ScrollController();
  RxInt currentIndex = 0.obs;
  final List<GlobalKey> globalKeyList = [];
  final addedToCart = false.obs;
  late final RxMap<String, int> selectedProduct = <String, int>{}.obs;
  final productsRepo = Get.find<ProductsRepository>();
  final products = RxV(<ProductsSectionModel>[]);

  void changeTabIndex(int index) {
    currentIndex.value = index;
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  Future<void> getProducts() async {
    products
      ..setPending()
      ..fromApi = await productsRepo.getProducts();
  }

  @override
  Future<void> onInit() async {
    await load();

    List.generate(
      products.data.length,
      (index) => globalKeyList.add(
        GlobalKey(debugLabel: index.toString()),
      ),
    );
    super.onInit();
  }

  Future<void> load() async {
    await Future.wait([
      getProducts(),
    ]);
  }
}
