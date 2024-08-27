import 'dart:convert';

import 'package:groceryapp/core/exception/exception.dart';
import 'package:groceryapp/features/data/model/grocery_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class GroceryLocalDataSource {
  Future<List<GroceryModel>> getGroceries();
  Future<void> cacheGroceries(List<GroceryModel> groceryToCache);
}

const CACHED_GROCERIES = 'CACHED_GROCERIES';

class GroceryLocalDataSourceImpl extends GroceryLocalDataSource {
  final SharedPreferences sharedPreferences;

  GroceryLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<void> cacheGroceries(List<GroceryModel> groceryToCache) {
    try {
      final jsonGrocery = json.encode(GroceryModel.toJsonList(groceryToCache));
      return sharedPreferences.setString(CACHED_GROCERIES, jsonGrocery);
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<List<GroceryModel>> getGroceries() {
    try {
      final GroceriesString = sharedPreferences.getString(CACHED_GROCERIES);

      if (GroceriesString != null) {
        final decodedJson = json.decode(GroceriesString);
        return Future.value(GroceryModel.fromJsonList(decodedJson));
      } else {
        throw CacheException();
      }
    } catch (e) {
      throw CacheException();
    }
  }
}
