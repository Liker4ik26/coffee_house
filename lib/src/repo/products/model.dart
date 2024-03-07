class ProductModel {
  const ProductModel( {
    required this.image,
    required this.name,
    required this.cost,
    required this.id,
  });

  final String id;
  final String image;
  final String name;
  final double cost;
}

class ProductsSectionModel {
  ProductsSectionModel({
    required this.category,
    required this.productsList,
  });

  final String category;
  final List<ProductModel> productsList;
}
