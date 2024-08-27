import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:groceryapp/features/data/datasources/grocery_remote_data_source.dart';
import 'package:groceryapp/features/data/datasources/local_data_source.dart';
import 'package:groceryapp/features/data/repositories/grocery_repo_implemetation.dart';
import 'package:groceryapp/features/domain/repositories/grocery_repository.dart';
import 'package:groceryapp/features/domain/usecases/get_groceries_usecase.dart';
import 'package:groceryapp/features/domain/usecases/get_grocry_by_id_usecase.dart';
import 'package:groceryapp/features/presentation/bloc/grocery_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/platform/network_info.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Features - Product

  // Bloc
  sl.registerFactory(
      () => GroceryBloc(getGroceryByIdUsecase: sl(), getGrocerysUsecase: sl()));

  // Usecases
  sl.registerLazySingleton(() => GetGroceriesUseCase(groceryRepository: sl()));
  sl.registerLazySingleton(
      () => GetGroceryByIdUsecase(groceryRepository: sl()));

  // Repositories
  sl.registerLazySingleton<GroceryRepository>(() => GroceryRepoImplemetation(
      groceryLocalDataSource: sl(),
      groceryRemoteDataSource: sl(),
      networkInfo: sl()));

  // Data sources

  sl.registerLazySingleton<GroceryRemoteDataSource>(
      () => GroceryRemoteDataSourceImpl(client: sl()));

  sl.registerLazySingleton<GroceryLocalDataSource>(
      () => GroceryLocalDataSourceImpl(sharedPreferences: sl()));

  // Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  //external
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
