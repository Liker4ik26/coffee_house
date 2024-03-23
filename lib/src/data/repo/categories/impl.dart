import 'package:coffee_house/src/data/models/categories/category_model.dart';
import 'package:coffee_house/src/data/network/error/dio_error.dart';
import 'package:coffee_house/src/data/repo/categories/repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class CategoriesRepositoryImpl implements CategoriesRepository {
  final Dio dioClient;

  CategoriesRepositoryImpl({required this.dioClient});

  @override
  Future<List<CategoryModel>> getCategories(limit, page) async {
    try {
      final res = await dioClient.get(
          dotenv.env['CATEGORIES']!,
          queryParameters: <String, dynamic>{
            // 'category': category,
            // 'page': page,
          }
      );
      print(res.data['data']);
      if (res.statusCode == 200) {
        final List<dynamic> data = res.data['data'];
        final categories = data.map((e) => CategoryModel.fromJson(e)).toList();
        return categories;
      } else {
        throw Exception('Failed to load products');
      }
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }
}