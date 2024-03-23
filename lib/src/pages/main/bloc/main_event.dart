part of 'main_bloc.dart';

abstract class MainEvent extends Equatable {}

class LoadProductList extends MainEvent {
  LoadProductList({
    this.completer,
  });

  final Completer? completer;

  @override
  List<Object?> get props => [completer];
}

class CurrentIndexUpdated extends MainEvent {
  final int updatedIndex;

  CurrentIndexUpdated(this.updatedIndex);

  @override
  List<Object?> get props => throw UnimplementedError();
}

class AddToCartEvent extends MainEvent {
  final int productId;

  AddToCartEvent(this.productId);

  @override
  List<Object?> get props => throw UnimplementedError();
}

class RemoveFromCartEvent extends MainEvent {
  final int productId;

  RemoveFromCartEvent(this.productId);

  @override
  List<Object?> get props => throw UnimplementedError();
}

class LoadCategoriesList extends MainEvent {
  LoadCategoriesList({
    this.completer,
  });

  final Completer? completer;

  @override
  List<Object?> get props => [completer];
}
