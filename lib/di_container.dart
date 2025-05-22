

import 'package:dio/dio.dart';
import 'package:ebtech_task/data/datasource/dio_client.dart';
import 'package:ebtech_task/data/repositories/cart_repo.dart';
import 'package:ebtech_task/data/repositories/product_repo.dart';
import 'package:ebtech_task/provider/cart_provider.dart';
import 'package:ebtech_task/provider/products_provider.dart';
import 'package:ebtech_task/utill/app_constants.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Core
  sl.registerLazySingleton(() => DioClient(baseUrl: AppConstants.baseUrl,dio:  sl()));

  // Repository
  sl.registerLazySingleton(() => ProductRepo(dioClient: sl()));
  sl.registerLazySingleton(() => CartRepo(sharedPreferences: sl()));

  // Provider
  sl.registerFactory(() => ProductsProvider(productRepo: sl()));
  sl.registerFactory(() => CartProvider(cartRepo: sl()));

  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => Dio());
  // sl.registerLazySingleton(() => LoggingInterceptor());
}
