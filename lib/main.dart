import 'package:coffee_house/src/app/app.dart';
import 'package:coffee_house/src/pages/main/main_controller.dart';
import 'package:coffee_house/src/repo/products/mock.dart';
import 'package:coffee_house/src/repo/products/repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Get
    ..lazyPut(MainController.new)

    //repositories
    ..put<ProductsRepository>(ProductsRepositoryMock());
  runApp(const App());
}
