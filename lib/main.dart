import 'package:coffee_house/src/app/app.dart';
import 'package:coffee_house/src/data/network/dio_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  DioClient();
  runApp(const App());
}
