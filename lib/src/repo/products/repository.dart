import 'package:coffee_house/src/repo/products/model.dart';
import 'package:coffee_house/src/shared/api/types.dart';

abstract class ProductsRepository {
  const ProductsRepository._();
  FutureE<List<ProductsSectionModel>> getProducts();
}