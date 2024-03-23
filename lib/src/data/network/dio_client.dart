import 'dart:async';

import 'package:coffee_house/src/app/app.dart';
import 'package:coffee_house/src/data/repo/categories/impl.dart';
import 'package:coffee_house/src/data/repo/categories/repository.dart';
import 'package:coffee_house/src/data/repo/products/impl.dart';
import 'package:coffee_house/src/data/repo/products/repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_bloc_logger/talker_bloc_logger.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';
import 'package:talker_flutter/talker_flutter.dart';

class DioClient {
  final Dio _dio = Dio();
  final talker = TalkerFlutter.init();

  DioClient() {
    GetIt.I.registerSingleton(talker);
    _dio.options.baseUrl = dotenv.env['BASE_URL']!;
    _dio.interceptors.add(
      TalkerDioLogger(
        talker: talker,
        settings: const TalkerDioLoggerSettings(
          printRequestData: false,
        ),
      ),
    );
    Bloc.observer = TalkerBlocObserver(
      talker: talker,
      settings: const TalkerBlocLoggerSettings(
        printStateFullData: false,
        printEventFullData: false,
      ),
    );

    GetIt.I.registerLazySingleton<ProductsRepository>(
      () => ProductsRepositoryImpl(
        dioClient: _dio,
      ),
    );
    GetIt.I.registerLazySingleton<CategoriesRepository>(
      () => CategoriesRepositoryImpl(
        dioClient: _dio,
      ),
    );

    FlutterError.onError =
        (details) => GetIt.I<Talker>().handle(details.exception, details.stack);

    runZonedGuarded(() => runApp(const App()), (e, st) {
      GetIt.I<Talker>().handle(e, st);
    });
  }

  Future<Response> get(
    String url, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.get(
        url,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      throw e.toString();
    }
  }
}
