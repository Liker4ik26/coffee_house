import '../../models/products/product_model.dart';

abstract class ProductsRepository {
  const ProductsRepository._();

  Future<List<ProductModel>> getProducts(int category, int page);
}
