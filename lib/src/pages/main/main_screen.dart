import 'dart:async';

import 'package:coffee_house/src/data/repo/categories/repository.dart';
import 'package:coffee_house/src/data/repo/products/repository.dart';
import 'package:coffee_house/src/pages/main/bloc/main_bloc.dart';
import 'package:coffee_house/src/pages/main/widgets/category_app_bar.dart';
import 'package:coffee_house/src/pages/main/widgets/product_grid.dart';
import 'package:coffee_house/src/shared/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _mainBloc = MainBloc(
    GetIt.I<ProductsRepository>(),
    GetIt.I<CategoriesRepository>(),
  );

  late Map<int, int> selectedProduct = <int, int>{};

  @override
  void initState() {
    _mainBloc.itemPositionsListener = ItemPositionsListener.create();
    _mainBloc.itemScrollController = ItemScrollController();
    final itemPositionsListenable =
        _mainBloc.itemPositionsListener.itemPositions;
    itemPositionsListenable.addListener(() {
      _mainBloc.currentIndex = itemPositionsListenable.value.first.index;
    });

    _mainBloc.add(LoadProductList());
    super.initState();
  }

  @override
  void dispose() {
    _mainBloc.scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.color.background,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(0),
          child: BlocBuilder<MainBloc, MainState>(
            bloc: _mainBloc,
            builder: (context, state) {
              if (state is ProductListLoaded) {
                return CategoryAppBar(
                  categories: state.categoriesList,
                  currentIndex: _mainBloc.currentIndex,
                  itemScrollController: _mainBloc.itemScrollController,
                );
              }
              return Container();
            },
          ),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          final completer = Completer();
          _mainBloc.add(LoadProductList(completer: completer));
          return completer.future;
        },
        child: BlocBuilder<MainBloc, MainState>(
          bloc: _mainBloc,
          builder: (context, state) {
            if (state is ProductListLoaded) {
              return ProductGrid(
                productsList: state.productsList,
                itemPositionsListener: _mainBloc.itemPositionsListener,
                itemScrollController: _mainBloc.itemScrollController,
                categoriesList: state.categoriesList,
                selectedProduct: _mainBloc.selectedProduct,
              );
            }
            if (state is ProductListLoadingFailure) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Something went wrong',
                      style: context.text.robotoMedium16,
                    ),
                    Text(
                      'Please try againg later',
                      style: context.text.robotoRegular12,
                    ),
                    const SizedBox(height: 30),
                    TextButton(
                      onPressed: () {
                        _mainBloc.add(LoadProductList());
                      },
                      child: const Text('Try againg'),
                    ),
                  ],
                ),
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
