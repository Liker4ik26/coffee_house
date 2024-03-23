import 'package:coffee_house/src/data/models/categories/category_model.dart';
import 'package:coffee_house/src/data/models/products/product_model.dart';
import 'package:coffee_house/src/pages/main/bloc/main_bloc.dart';
import 'package:coffee_house/src/pages/main/widgets/product_card_widget.dart';
import 'package:coffee_house/src/pages/main/widgets/title_category_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_utils/src/extensions/export.dart';
import 'package:get_it/get_it.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../../data/repo/categories/repository.dart';
import '../../../data/repo/products/repository.dart';

class ProductGrid extends StatefulWidget {
  const ProductGrid({
    Key? key,
    required this.productsList,
    required this.itemPositionsListener,
    required this.itemScrollController,
    required this.categoriesList,
    required this.selectedProduct,
  }) : super(key: key);

  final List<ProductModel> productsList;
  final List<CategoryModel> categoriesList;
  final ItemPositionsListener itemPositionsListener;
  final ItemScrollController itemScrollController;
  final Map<int, int> selectedProduct;

  @override
  _ProductGridState createState() => _ProductGridState();
}

class _ProductGridState extends State<ProductGrid> {
  late MainBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = MainBloc(
      GetIt.I<ProductsRepository>(),
      GetIt.I<CategoriesRepository>(),
    );
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScrollablePositionedList.builder(
      itemCount: widget.categoriesList.length,
      itemPositionsListener: widget.itemPositionsListener,
      itemScrollController: widget.itemScrollController,
      padding: const EdgeInsets.all(16),
      itemBuilder: (context, section) {
        final categorySlug = widget.categoriesList[section].slug;
        final categorizedProducts = widget.productsList
            .where((product) => product.category!.slug == categorySlug)
            .toList();
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitleCategoryWidget(
              title: categorySlug!,
            ).paddingSymmetric(vertical: 16),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16.0,
                crossAxisSpacing: 16.0,
                childAspectRatio:
                    (MediaQuery.of(context).size.width - 24) / 2 / 220,
              ),
              itemCount: categorizedProducts.length,
              itemBuilder: (context, index) {
                final product = categorizedProducts[index];
                return BlocBuilder<MainBloc, MainState>(
                  bloc: bloc,
                  builder: (context, state) {
                      return ProductCardWidget(
                        onClickMinus: (id) {
                          bloc.add(RemoveFromCartEvent(id));
                        },
                        onClickPlus: (id) {
                          bloc.add(AddToCartEvent(id));
                        },
                        quantity:bloc.selectedProduct[product.id] != null
                            ? bloc.selectedProduct[product.id]!
                            : 0,
                        productModel: product,
                        addedToCart: () {

                        },
                      );
                  },
                );
              },
            ),
          ],
        );
      },
    );
  }
}
