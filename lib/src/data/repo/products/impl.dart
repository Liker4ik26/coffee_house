import 'package:coffee_house/src/data/network/error/dio_error.dart';
import 'package:coffee_house/src/data/repo/products/repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../models/products/product_model.dart';

class ProductsRepositoryImpl implements ProductsRepository {
  final Dio dioClient;

  ProductsRepositoryImpl({required this.dioClient});

  @override
  Future<List<ProductModel>> getProducts(category, page) async {
    try {
      final res = await dioClient
          .get(dotenv.env['PRODUCTS']!, queryParameters: <String, dynamic>{
        // 'category': category,
        // 'page': page,
      });
      print(res.data['data']);
      if (res.statusCode == 200) {
        final List<dynamic> data = res.data['data'];
        final products = data.map((e) => ProductModel.fromJson(e)).toList();
        return products;
      } else {
        throw Exception('Failed to load products');
      }
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }
}
