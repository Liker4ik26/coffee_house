part of 'main_bloc.dart';

abstract class MainState {}

class MainInitial extends MainState {}

class ProductListLoading extends MainState {}

class ProductListLoaded extends MainState {
  ProductListLoaded({
    required this.productsList,
    required this.categoriesList,
  });

  final List<ProductModel> productsList;
  final List<CategoryModel> categoriesList;
}

class CurrentIndex extends MainState {
  CurrentIndex({required this.currentIndex});

  final int currentIndex;
}

class CartQuantityState extends MainState {
  final Map<int, int> selectedProducts;

  CartQuantityState(this.selectedProducts);
}

class ProductListLoadingFailure extends MainState {
  ProductListLoadingFailure({
    this.exception,
  });

  final Object? exception;

  @override
  List<Object?> get props => [exception];
}
