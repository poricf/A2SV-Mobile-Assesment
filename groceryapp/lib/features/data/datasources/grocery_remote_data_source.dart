import 'dart:convert';
import 'dart:io';

import 'package:groceryapp/core/constants/constants.dart';
import 'package:groceryapp/features/data/model/grocery_model.dart';
import 'package:http/http.dart' as http;

abstract class GroceryRemoteDataSource {
  Future<List<GroceryModel>> getGroceries();
  Future<GroceryModel> getGroceryById(String id);
}

class GroceryRemoteDataSourceImpl extends GroceryRemoteDataSource {
  final http.Client client;

  GroceryRemoteDataSourceImpl({required this.client});

  @override
  Future<List<GroceryModel>> getGroceries() async {
    try {
      final response = await client.get(Uri.parse(Urls.baseUrl));
      if (response.statusCode == 200) {
        return GroceryModel.fromJsonList(json.decode(response.body)['data']);
      } else {
        throw Exception('Failed to load groceries');
      }
    } on SocketException {
      throw const SocketException('No Internet Connection');
    }
  }

  @override
  Future<GroceryModel> getGroceryById(String id) async {
    final response = await client.get(Uri.parse('${Urls.baseUrl}/$id'));
    if (response.statusCode == 200) {
      return GroceryModel.fromJson(json.decode(response.body)['data']);
    } else {
      throw Exception('Failed to load grocery');
    }
  }
}
