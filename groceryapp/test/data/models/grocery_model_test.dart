import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:groceryapp/features/data/model/grocery_model.dart';
import 'package:groceryapp/features/data/model/optionModel.dart';

import '../../helpers/json_reader.dart';

void main() {
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

  test('should be a subclass of Grocery entity', () async {
    //assert
    expect(testGroceryModel, isA<GroceryModel>());
  });

  test('should return a valid model from Json', () async {
    final Map<String, dynamic> jsonMap = json
        .decode(readJson('helpers/dummy_data/dummy_grocery_response.json'))[0];

    // act
    final result = GroceryModel.fromJson(jsonMap);

    // assert
    expect(result, testGroceryModel);
  });
}
