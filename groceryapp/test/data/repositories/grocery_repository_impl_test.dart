import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:groceryapp/features/data/model/grocery_model.dart';
import 'package:groceryapp/features/data/model/optionModel.dart';
import 'package:groceryapp/features/data/repositories/grocery_repo_implemetation.dart';
import 'package:groceryapp/features/domain/entities/grocery_entity.dart';
import 'package:groceryapp/features/domain/entities/options_entity.dart';

import 'package:mockito/mockito.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late MockGroceryRemoteDataSource mockGroceryRemoteDataSource;
  late MockGroceryLocalDataSource mockGroceryLocalDataSource;
  late MockNetworkInfo mockNetworkInfo;

  late GroceryRepoImplemetation groceryRepoImplementation;
  final testGroceryModelList = [
    GroceryModel(
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
    ),
  ];
  final testGroceryEntityList = [
    Grocery(
      id: '3',
      title: 'Chicken Burger',
      description:
          'A delicious chicken burger served on a toasted bun with fresh lettuce.',
      price: 11,
      imageUrl: 'imageurl',
      rating: 4.9,
      discount: 6,
      options: [
        OptionEntity(id: 'o1', name: 'Add Cheese', price: 0.5),
        OptionEntity(id: 'o2', name: 'Add Bacon', price: 1),
        OptionEntity(id: 'o3', name: 'Add Meat', price: 0),
      ],
    ),
  ];

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
  final testGroceryEntity = Grocery(
    id: '3',
    title: 'Chicken Burger',
    description:
        'A delicious chicken burger served on a toasted bun with fresh lettuce.',
    price: 11,
    imageUrl: 'imageurl',
    rating: 4.9,
    discount: 6,
    options: [
      OptionEntity(id: 'o1', name: 'Add Cheese', price: 0.5),
      OptionEntity(id: 'o2', name: 'Add Bacon', price: 1),
      OptionEntity(id: 'o3', name: 'Add Meat', price: 0),
    ],
  );
  // setUp(() {
  //   mockGroceryLocalDataSource = MockGroceryLocalDataSource();
  //   mockGroceryRemoteDataSource = MockGroceryRemoteDataSource();
  //   mockNetworkInfo = MockNetworkInfo();
  //   groceryRepoImplementation = GroceryRepoImplementation(
  //       groceryRemoteDataSource: mockGroceryRemoteDataSource,
  //       groceryLocalDataSource: mockGroceryLocalDataSource,
  //       networkInfo: mockNetworkInfo);
  // });
}
