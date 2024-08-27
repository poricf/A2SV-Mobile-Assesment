import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:groceryapp/core/exception/exception.dart';
import 'package:groceryapp/core/failure/failure.dart';
import 'package:groceryapp/core/platform/network_info.dart';
import 'package:groceryapp/features/data/datasources/grocery_remote_data_source.dart';
import 'package:groceryapp/features/data/datasources/local_data_source.dart';
import 'package:groceryapp/features/data/model/grocery_model.dart';
import 'package:groceryapp/features/domain/entities/grocery_entity.dart';
import 'package:groceryapp/features/domain/repositories/grocery_repository.dart';

class GroceryRepoImplemetation implements GroceryRepository {
  late final GroceryRemoteDataSource groceryRemoteDataSource;
  late final NetworkInfo networkInfo;
  late final GroceryLocalDataSource groceryLocalDataSource;

  GroceryRepoImplemetation(
      {required this.groceryRemoteDataSource,
      required this.networkInfo,
      required this.groceryLocalDataSource});

  Future<Either<Failure, Grocery>> getGrocery(String id) async {
    if (await networkInfo.isConnected) {
      try {
        final result = await groceryRemoteDataSource.getGroceryById(id);
        return Right(result);
      } on ServerException {
        return const Left(ServerFailure(message: 'An error occurred'));
      } on SocketException {
        return const Left(
            ConnectionFailure(message: 'Failed to connect to the internet'));
      }
    } else {
      return const Left(
          ConnectionFailure(message: 'Failed to connect to the internet'));
    }
  }

  Future<Either<Failure, List<Grocery>>> getGroceries() async {
    if (await networkInfo.isConnected) {
      try {
        final result = await groceryRemoteDataSource.getGroceries();
        try {
          await groceryLocalDataSource.cacheGroceries(result);
        } on CacheException {
          debugPrint('Caching All Products error');
        }
        return Right(GroceryModel.toEntities(result));
      } on ServerException {
        return const Left(ServerFailure(message: 'An error occurred'));
      } on SocketException {
        return const Left(
            ConnectionFailure(message: 'Failed to connect to the internet'));
      }
    } else {
      try {
        final result = await groceryLocalDataSource.getGroceries();
        return Right(GroceryModel.toEntities(result));
      } on CacheException {
        return const Left(CacheFailure(message: 'An error occurred'));
      }
    }
  }
}
