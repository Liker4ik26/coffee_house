import 'dart:async';

import 'package:coffee_house/src/data/models/categories/category_model.dart';
import 'package:coffee_house/src/data/models/products/product_model.dart';
import 'package:coffee_house/src/data/repo/categories/repository.dart';
import 'package:coffee_house/src/data/repo/products/repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:talker_flutter/talker_flutter.dart';

part 'main_event.dart';

part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc(this.productsRepository, this.categoriesRepository)
      : super(MainInitial()) {
    on<LoadProductList>(_load);
    on<AddToCartEvent>((event, emit) {
      if (selectedProducts.containsKey(event.productId)) {
        selectedProducts[event.productId] =
            selectedProducts[event.productId]! + 1;
      } else {
        selectedProducts[event.productId] = 1;
      }
      emit(CartQuantityState(Map.from(selectedProducts)));
    });
    on<RemoveFromCartEvent>((event, emit) {
      if (selectedProducts.containsKey(event.productId)) {
        if (selectedProducts[event.productId]! > 1) {
          selectedProducts[event.productId] =
              selectedProducts[event.productId]! - 1;
        } else {
          selectedProducts.remove(event.productId);
        }
        emit(CartQuantityState(Map.from(selectedProducts)));
      }
    });
  }

  final Map<int, int> selectedProducts = {};
  final ProductsRepository productsRepository;
  final CategoriesRepository categoriesRepository;
  late ScrollController scrollController = ScrollController();
  late final ItemPositionsListener itemPositionsListener;
  late final ItemScrollController itemScrollController;
  late int currentIndex = 0;
  late final selectedProduct = <int, int>{};

  Future<void> _load(
    LoadProductList event,
    Emitter<MainState> emit,
  ) async {
    try {
      if (state is! ProductListLoaded) {
        emit(ProductListLoading());
      }
      final categoriesList = await categoriesRepository.getCategories(20, 2);
      final productsList = await productsRepository.getProducts(20, 2);
      emit(ProductListLoaded(
        productsList: productsList,
        categoriesList: categoriesList,
      ));
    } catch (e, st) {
      emit(ProductListLoadingFailure(exception: e));
      GetIt.I<Talker>().handle(e, st);
    } finally {
      event.completer?.complete();
    }
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    GetIt.I<Talker>().handle(error, stackTrace);
  }
}
