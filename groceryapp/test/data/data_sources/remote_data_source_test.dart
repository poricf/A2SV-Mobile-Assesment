import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:groceryapp/core/constants/constants.dart';
import 'package:groceryapp/core/exception/exception.dart';
import 'package:groceryapp/features/data/datasources/grocery_remote_data_source.dart';
import 'package:groceryapp/features/data/model/grocery_model.dart';
import 'package:groceryapp/features/data/model/optionModel.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import '../../helpers/json_reader.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late MockHttpClient mockHttpClient;
  late GroceryRemoteDataSourceImpl groceryRemoteDataSourceImpl;

  setUp(() {
    mockHttpClient = MockHttpClient();
    groceryRemoteDataSourceImpl =
        GroceryRemoteDataSourceImpl(client: mockHttpClient);
  });

  const groceryId = '66be460f71fccd1506882d24';
  const jsonCurrent = 'helpers/dummy_data/mock_data.json';
  const jsonAll = 'helpers/dummy_data/mock_data_list.json';
  final testGroceryModel = GroceryModel(
    id: '3',
    title: 'Chicken Burger',
    description:
        'A delicious chicken burger served on a toasted bun with fresh lettuce.',
    price: 11,
    imageUrl: 'imageurl',
    rating: 4.9,
    discount: 6,
    options: [
      OptionModel(id: 'o1', name: 'Add Cheese', price: 0.5),
      OptionModel(id: 'o2', name: 'Add Bacon', price: 1),
      OptionModel(id: 'o3', name: 'Add Meat', price: 0),
    ],
    );

    // get current product
    group('get current Grocery', () {
    test('should return Grocery model when the response code is 200', () async {
      // arrange
      when(mockHttpClient.get(Uri.parse(Urls.getGroceryById(groceryId))))
        .thenAnswer((_) async => http.Response(readJson(jsonCurrent), 200));
      // act
      final result =
        await groceryRemoteDataSourceImpl.getGroceryById(groceryId);
      // assert
      expect(result, isA<GroceryModel>());
    });

    test('should throw a SocketException when the response code is 404',
      () async {
      // arrange
      when(mockHttpClient.get(Uri.parse(Urls.getGroceryById(groceryId))))
        .thenThrow(const SocketException('No Internet Connection'));
      // act
      final call = groceryRemoteDataSourceImpl.getGroceryById;
      // assert
      expect(() => call(groceryId), throwsA(isA<SocketException>()));
    });

    test('should throw a socket exception if it happens', () async {
      // arrange
      when(mockHttpClient.get(Uri.parse(Urls.getGroceryById(groceryId))))
        .thenAnswer((_) async => http.Response(readJson(jsonCurrent), 400));
      // act and assert
      expect(() => groceryRemoteDataSourceImpl.getGroceryById(groceryId),
        throwsA(isA<Exception>()));
    });
    });

    // get all product
    group('get all Groceries', () {
    test('should return list of product model when the response code is 200',
      () async {
      // arrange
      when(mockHttpClient.get(Uri.parse(Urls.baseUrl)))
        .thenAnswer((_) async => http.Response(readJson(jsonAll), 200));
      // act
      final result = await groceryRemoteDataSourceImpl.getGroceries();
      // assert
      expect(result, isA<List<GroceryModel>>());
    });

    test('should throw a socket exception if it happens', () async {
      // arrange
      when(mockHttpClient.get(Uri.parse(Urls.baseUrl)))
        .thenThrow(const SocketException('No Internet Connection'));
      // act and assert
      expect(() => groceryRemoteDataSourceImpl.getGroceries(),
        throwsA(isA<SocketException>()));
    });

    test('should throw a server exception if it happens', () async {
      // arrange
      when(mockHttpClient.get(Uri.parse(Urls.baseUrl)))
        .thenAnswer((_) async => http.Response(readJson(jsonAll), 400));
      // act and assert
      expect(() => groceryRemoteDataSourceImpl.getGroceries(),
        throwsA(isA<Exception>()));
    });
    });
  }
