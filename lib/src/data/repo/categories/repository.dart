import 'package:coffee_house/src/data/models/categories/category_model.dart';

abstract class CategoriesRepository {
  const CategoriesRepository._();

  Future<List<CategoryModel>> getCategories(int limit, int page);
}
